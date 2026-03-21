import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_event.freezed.dart';

@freezed
sealed class SeriesEvent with _$SeriesEvent {
  const factory SeriesEvent.loadCategories() = SeriesLoadCategories;
  const factory SeriesEvent.loadSeries({
    String? categoryId,
  }) = SeriesLoadList;
  const factory SeriesEvent.searchSeries({required String query}) =
      SeriesSearch;
  const factory SeriesEvent.loadSeriesInfo({required int seriesId}) =
      SeriesLoadInfo;
}
