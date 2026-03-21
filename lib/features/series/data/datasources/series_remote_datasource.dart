import 'package:iptv_macos/core/error/exceptions.dart';
import 'package:iptv_macos/core/network/xtream_api_service.dart';
import 'package:iptv_macos/features/catalog/data/models/category_model.dart';

abstract class SeriesRemoteDataSource {
  Future<List<CategoryModel>> getSeriesCategories();
  Future<List<Map<String, dynamic>>> getSeries({String? categoryId});
  Future<Map<String, dynamic>> getSeriesInfo(int seriesId);
}

class SeriesRemoteDataSourceImpl implements SeriesRemoteDataSource {
  const SeriesRemoteDataSourceImpl(this._xtreamApi);

  final XtreamApiService _xtreamApi;

  @override
  Future<List<CategoryModel>> getSeriesCategories() async {
    try {
      final data = await _xtreamApi.getSeriesCategories();
      return data
          .map((e) => CategoryModel.fromXtream(e as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch series categories: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getSeries({String? categoryId}) async {
    try {
      final data = await _xtreamApi.getSeries(categoryId: categoryId);
      return data.cast<Map<String, dynamic>>();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch series: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getSeriesInfo(int seriesId) async {
    try {
      return await _xtreamApi.getSeriesInfo(seriesId);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch series info: $e');
    }
  }
}
