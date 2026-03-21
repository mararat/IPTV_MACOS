import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iptv_macos/features/catalog/domain/entities/category_entity.dart';
import 'package:iptv_macos/features/series/domain/entities/series_detail_entity.dart';
import 'package:iptv_macos/features/series/domain/entities/series_entity.dart';

part 'series_state.freezed.dart';

@freezed
abstract class SeriesState with _$SeriesState {
  const factory SeriesState({
    @Default([]) List<CategoryEntity> categories,
    @Default([]) List<SeriesEntity> seriesList,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingCategories,
    @Default(false) bool isLoadingDetail,
    String? selectedCategoryId,
    SeriesDetailEntity? selectedSeriesDetail,
    String? errorMessage,
  }) = _SeriesState;
}
