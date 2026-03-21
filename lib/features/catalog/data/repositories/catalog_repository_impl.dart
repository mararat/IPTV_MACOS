import 'package:iptv_macos/core/error/error_handler.dart';
import 'package:iptv_macos/core/error/failures.dart';
import 'package:iptv_macos/core/network/network_info.dart';
import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/features/catalog/data/datasources/catalog_remote_datasource.dart';
import 'package:iptv_macos/features/catalog/data/models/category_model.dart';
import 'package:iptv_macos/features/catalog/data/models/channel_model.dart';
import 'package:iptv_macos/features/catalog/data/models/vod_model.dart';
import 'package:iptv_macos/features/catalog/domain/entities/category_entity.dart';
import 'package:iptv_macos/features/catalog/domain/entities/channel_entity.dart';
import 'package:iptv_macos/features/catalog/domain/entities/vod_entity.dart';
import 'package:iptv_macos/features/catalog/domain/repositories/catalog_repository.dart';

class CatalogRepositoryMacImpl implements CatalogRepository {
  const CatalogRepositoryMacImpl(this._remoteDataSource, this._networkInfo);

  final CatalogRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  ResultFuture<List<CategoryEntity>> getLiveCategories() async {
    if (!await _networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      final models = await _remoteDataSource.getLiveCategories();
      return Right(models.map(_catToEntity).toList());
    } catch (e) { return Left(ErrorHandler.handleException(e)); }
  }

  @override
  ResultFuture<List<CategoryEntity>> getVodCategories() async {
    if (!await _networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      final models = await _remoteDataSource.getVodCategories();
      return Right(models.map(_catToEntity).toList());
    } catch (e) { return Left(ErrorHandler.handleException(e)); }
  }

  @override
  ResultFuture<List<ChannelEntity>> getLiveStreams({String? categoryId, String? query}) async {
    if (!await _networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      final models = await _remoteDataSource.getLiveStreams(categoryId: categoryId);
      var entities = models.map(_chToEntity).toList();
      if (query != null && query.isNotEmpty) {
        final q = query.toLowerCase();
        entities = entities.where((e) => e.name.toLowerCase().contains(q)).toList();
      }
      return Right(entities);
    } catch (e) { return Left(ErrorHandler.handleException(e)); }
  }

  @override
  ResultFuture<List<VodEntity>> getVodStreams({String? categoryId, String? query}) async {
    if (!await _networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      final models = await _remoteDataSource.getVodStreams(categoryId: categoryId);
      var entities = models.map(_vodToEntity).toList();
      if (query != null && query.isNotEmpty) {
        final q = query.toLowerCase();
        entities = entities.where((e) => e.title.toLowerCase().contains(q)).toList();
      }
      return Right(entities);
    } catch (e) { return Left(ErrorHandler.handleException(e)); }
  }

  @override
  ResultFuture<VodEntity> getVodDetail(String id) async {
    if (!await _networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      return Right(_vodToEntity(await _remoteDataSource.getVodDetail(id)));
    } catch (e) { return Left(ErrorHandler.handleException(e)); }
  }

  static CategoryEntity _catToEntity(CategoryModel m) => CategoryEntity(id: m.id, name: m.name, iconUrl: m.iconUrl);
  static ChannelEntity _chToEntity(ChannelModel m) => ChannelEntity(id: m.id, name: m.name, logoUrl: m.logoUrl, categoryId: m.categoryId, streamId: m.streamId, epgChannelId: m.epgChannelId, tvArchive: m.tvArchive, tvArchiveDuration: m.tvArchiveDuration);
  static VodEntity _vodToEntity(VodModel m) => VodEntity(id: m.id, title: m.title, description: m.description, posterUrl: m.posterUrl, backdropUrl: m.backdropUrl, categoryId: m.categoryId, duration: m.duration, rating: m.rating, releaseYear: m.releaseYear, genre: m.genre, streamId: m.streamId, containerExtension: m.containerExtension);
}
