import 'package:iptv_macos/core/error/error_handler.dart';
import 'package:iptv_macos/core/error/failures.dart';
import 'package:iptv_macos/core/logging/app_logger.dart';
import 'package:iptv_macos/core/network/network_info.dart';
import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/features/catalog/domain/entities/category_entity.dart';
import 'package:iptv_macos/features/series/data/datasources/series_remote_datasource.dart';
import 'package:iptv_macos/features/series/domain/entities/series_detail_entity.dart';
import 'package:iptv_macos/features/series/domain/entities/series_entity.dart';
import 'package:iptv_macos/features/series/domain/repositories/series_repository.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  SeriesRepositoryImpl(this._remoteDataSource, this._networkInfo, this._logger);

  final SeriesRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final AppLogger _logger;

  // In-memory cache for series data
  final Map<String, _CacheEntry<List<SeriesEntity>>> _seriesCache = {};
  _CacheEntry<List<CategoryEntity>>? _categoriesCache;

  static const _cacheDuration = Duration(minutes: 30);

  @override
  ResultFuture<List<CategoryEntity>> getSeriesCategories() async {
    // Return cached if valid
    if (_categoriesCache != null && !_categoriesCache!.isExpired) {
      _refreshSeriesCategories();
      return Right(_categoriesCache!.data);
    }

    if (!await _networkInfo.isConnected) {
      // Return stale cache if available
      if (_categoriesCache != null) return Right(_categoriesCache!.data);
      return const Left(NetworkFailure());
    }
    try {
      final models = await _remoteDataSource.getSeriesCategories();
      final entities = models
          .map((m) =>
              CategoryEntity(id: m.id, name: m.name, iconUrl: m.iconUrl))
          .toList();
      _categoriesCache = _CacheEntry(entities);
      return Right(entities);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  ResultFuture<List<SeriesEntity>> getSeries(
      {String? categoryId, String? query}) async {
    final cacheKey = categoryId ?? '__all__';

    // For non-search queries, check cache first
    if (query == null || query.isEmpty) {
      final cached = _seriesCache[cacheKey];
      if (cached != null && !cached.isExpired) {
        _refreshSeries(categoryId);
        return Right(cached.data);
      }
    }

    if (!await _networkInfo.isConnected) {
      // Return stale cache if available
      final stale = _seriesCache[cacheKey];
      if (stale != null) return Right(stale.data);
      return const Left(NetworkFailure());
    }
    try {
      final rawList =
          await _remoteDataSource.getSeries(categoryId: categoryId);
      var entities = rawList.map(_mapSeriesJson).toList();

      // Cache the full list
      if (query == null || query.isEmpty) {
        _seriesCache[cacheKey] = _CacheEntry(entities);
      }

      if (query != null && query.isNotEmpty) {
        final lowerQuery = query.toLowerCase();
        entities = entities
            .where((e) => e.name.toLowerCase().contains(lowerQuery))
            .toList();
      }
      return Right(entities);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  ResultFuture<SeriesDetailEntity> getSeriesInfo(int seriesId) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final data = await _remoteDataSource.getSeriesInfo(seriesId);
      final info = data['info'] as Map<String, dynamic>? ?? {};
      final seasonsRaw = data['seasons'] as List<dynamic>? ?? [];
      final episodesRaw = data['episodes'] as Map<String, dynamic>? ?? {};

      final seasons = seasonsRaw.map((s) {
        final sMap = s as Map<String, dynamic>;
        return SeasonEntity(
          seasonNumber: sMap['season_number'] as int?,
          name: sMap['name']?.toString(),
          cover:
              sMap['cover']?.toString() ?? sMap['cover_big']?.toString(),
          overview: sMap['overview']?.toString(),
          episodeCount: sMap['episode_count'] as int?,
          airDate: sMap['air_date']?.toString(),
        );
      }).toList();

      final episodes = <String, List<EpisodeEntity>>{};
      for (final entry in episodesRaw.entries) {
        final list = (entry.value as List<dynamic>).map((e) {
          final eMap = e as Map<String, dynamic>;
          final eInfo = eMap['info'] as Map<String, dynamic>? ?? {};
          return EpisodeEntity(
            id: eMap['id']?.toString() ?? '',
            episodeNum: eMap['episode_num'] is int
                ? eMap['episode_num'] as int
                : int.tryParse(eMap['episode_num']?.toString() ?? '0'),
            title: eMap['title']?.toString(),
            containerExtension: eMap['container_extension']?.toString(),
            plot: eInfo['plot']?.toString(),
            image: eInfo['movie_image']?.toString(),
            releaseDate: eInfo['release_date']?.toString(),
            rating: _parseDouble(eInfo['rating']),
            duration: eInfo['duration']?.toString(),
            season: eMap['season'] is int
                ? eMap['season'] as int
                : int.tryParse(eMap['season']?.toString() ?? '0'),
          );
        }).toList();
        episodes[entry.key] = list;
      }

      return Right(SeriesDetailEntity(
        name: info['name']?.toString() ?? '',
        cover: info['cover']?.toString(),
        plot: info['plot']?.toString(),
        cast: info['cast']?.toString(),
        director: info['director']?.toString(),
        genre: info['genre']?.toString(),
        releaseDate: info['releaseDate']?.toString(),
        rating: _parseDouble(info['rating_5based'] ?? info['rating']),
        seasons: seasons,
        episodes: episodes,
      ));
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  // ── Background refresh ──

  Future<void> _refreshSeriesCategories() async {
    try {
      if (!await _networkInfo.isConnected) return;
      final models = await _remoteDataSource.getSeriesCategories();
      _categoriesCache = _CacheEntry(models
          .map((m) =>
              CategoryEntity(id: m.id, name: m.name, iconUrl: m.iconUrl))
          .toList());
    } catch (e, st) {
      _logger.debug('Background refresh series categories failed: $e', st);
    }
  }

  Future<void> _refreshSeries(String? categoryId) async {
    try {
      if (!await _networkInfo.isConnected) return;
      final rawList =
          await _remoteDataSource.getSeries(categoryId: categoryId);
      final entities = rawList.map(_mapSeriesJson).toList();
      _seriesCache[categoryId ?? '__all__'] = _CacheEntry(entities);
    } catch (e, st) {
      _logger.debug('Background refresh series failed: $e', st);
    }
  }

  static SeriesEntity _mapSeriesJson(dynamic raw) {
    final json = raw as Map<String, dynamic>;
    return SeriesEntity(
      seriesId: json['series_id'] is int
          ? json['series_id'] as int
          : int.tryParse(json['series_id']?.toString() ?? '0') ?? 0,
      name: json['name']?.toString() ?? '',
      cover: json['cover']?.toString() ?? json['stream_icon']?.toString(),
      plot: json['plot']?.toString(),
      cast: json['cast']?.toString(),
      director: json['director']?.toString(),
      genre: json['genre']?.toString(),
      releaseDate: json['releaseDate']?.toString(),
      rating: _parseDouble(json['rating_5based'] ?? json['rating']),
      categoryId: json['category_id']?.toString(),
      backdropPath: json['backdrop_path'] is List
          ? (json['backdrop_path'] as List).map((e) => e.toString()).toList()
          : [],
    );
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString());
  }
}

class _CacheEntry<T> {
  _CacheEntry(this.data) : createdAt = DateTime.now();

  final T data;
  final DateTime createdAt;

  bool get isExpired =>
      DateTime.now().difference(createdAt) >
      SeriesRepositoryImpl._cacheDuration;
}
