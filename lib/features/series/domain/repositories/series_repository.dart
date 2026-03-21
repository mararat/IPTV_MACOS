import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/features/catalog/domain/entities/category_entity.dart';
import 'package:iptv_macos/features/series/domain/entities/series_detail_entity.dart';
import 'package:iptv_macos/features/series/domain/entities/series_entity.dart';

abstract class SeriesRepository {
  ResultFuture<List<CategoryEntity>> getSeriesCategories();
  ResultFuture<List<SeriesEntity>> getSeries({String? categoryId, String? query});
  ResultFuture<SeriesDetailEntity> getSeriesInfo(int seriesId);
}
