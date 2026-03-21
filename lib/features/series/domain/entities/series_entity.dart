import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_entity.freezed.dart';

@freezed
abstract class SeriesEntity with _$SeriesEntity {
  const factory SeriesEntity({
    required int seriesId,
    required String name,
    String? cover,
    String? plot,
    String? cast,
    String? director,
    String? genre,
    String? releaseDate,
    double? rating,
    String? categoryId,
    @Default([]) List<String> backdropPath,
  }) = _SeriesEntity;
}
