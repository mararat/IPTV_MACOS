import 'package:freezed_annotation/freezed_annotation.dart';

part 'xtream_series.freezed.dart';
part 'xtream_series.g.dart';

@freezed
abstract class XtreamSeries with _$XtreamSeries {
  const factory XtreamSeries({
    @JsonKey(name: 'num') int? num,
    required String name,
    @JsonKey(name: 'series_id') required int seriesId,
    String? cover,
    String? plot,
    String? cast,
    String? director,
    String? genre,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'last_modified') String? lastModified,
    double? rating,
    @JsonKey(name: 'rating_5based') double? rating5based,
    @JsonKey(name: 'backdrop_path') List<String>? backdropPath,
    String? youtube,
    @JsonKey(name: 'episode_run_time') String? episodeRunTime,
    @JsonKey(name: 'category_id') String? categoryId,
  }) = _XtreamSeries;

  factory XtreamSeries.fromJson(Map<String, dynamic> json) =>
      _$XtreamSeriesFromJson(json);
}
