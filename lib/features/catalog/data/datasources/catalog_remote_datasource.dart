import 'package:iptv_macos/core/error/exceptions.dart';
import 'package:iptv_macos/core/network/xtream_api_service.dart';
import 'package:iptv_macos/features/catalog/data/models/category_model.dart';
import 'package:iptv_macos/features/catalog/data/models/channel_model.dart';
import 'package:iptv_macos/features/catalog/data/models/vod_model.dart';

double? _parseDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.tryParse(value.toString());
}

abstract class CatalogRemoteDataSource {
  Future<List<CategoryModel>> getLiveCategories();
  Future<List<CategoryModel>> getVodCategories();
  Future<List<ChannelModel>> getLiveStreams({String? categoryId});
  Future<List<VodModel>> getVodStreams({String? categoryId});
  Future<VodModel> getVodDetail(String id);
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  const CatalogRemoteDataSourceImpl(this._xtreamApi);

  final XtreamApiService _xtreamApi;

  @override
  Future<List<CategoryModel>> getLiveCategories() async {
    try {
      final data = await _xtreamApi.getLiveCategories();
      return data
          .map((e) => CategoryModel.fromXtream(e as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch live categories: $e');
    }
  }

  @override
  Future<List<CategoryModel>> getVodCategories() async {
    try {
      final data = await _xtreamApi.getVodCategories();
      return data
          .map((e) => CategoryModel.fromXtream(e as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch VOD categories: $e');
    }
  }

  @override
  Future<List<ChannelModel>> getLiveStreams({String? categoryId}) async {
    try {
      final data = await _xtreamApi.getLiveStreams(categoryId: categoryId);
      return data
          .map((e) => ChannelModel.fromXtream(e as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch live streams: $e');
    }
  }

  @override
  Future<List<VodModel>> getVodStreams({String? categoryId}) async {
    try {
      final data = await _xtreamApi.getVodStreams(categoryId: categoryId);
      return data
          .map((e) => VodModel.fromXtream(e as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch VOD streams: $e');
    }
  }

  @override
  Future<VodModel> getVodDetail(String id) async {
    try {
      final vodId = int.tryParse(id) ?? 0;
      final data = await _xtreamApi.getVodInfo(vodId);
      final info = data['info'] as Map<String, dynamic>? ?? {};
      final movieData = data['movie_data'] as Map<String, dynamic>? ?? {};
      return VodModel(
        id: id,
        title: info['name']?.toString() ?? movieData['name']?.toString() ?? '',
        description: info['plot']?.toString() ?? info['description']?.toString(),
        posterUrl: info['movie_image']?.toString() ?? info['cover_big']?.toString(),
        backdropUrl: info['backdrop_path'] is List
            ? (info['backdrop_path'] as List).isNotEmpty
                ? info['backdrop_path'][0]?.toString()
                : null
            : null,
        categoryId: movieData['category_id']?.toString(),
        duration: info['duration']?.toString(),
        rating: _parseDouble(info['rating']),
        releaseYear: info['releasedate']?.toString(),
        genre: info['genre']?.toString(),
        streamId: vodId,
        containerExtension: movieData['container_extension']?.toString(),
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch VOD detail: $e');
    }
  }
}
