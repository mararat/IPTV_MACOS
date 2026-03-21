import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_detail_entity.freezed.dart';

@freezed
abstract class SeriesDetailEntity with _$SeriesDetailEntity {
  const factory SeriesDetailEntity({
    required String name,
    String? cover,
    String? plot,
    String? cast,
    String? director,
    String? genre,
    String? releaseDate,
    double? rating,
    @Default([]) List<SeasonEntity> seasons,
    @Default({}) Map<String, List<EpisodeEntity>> episodes,
  }) = _SeriesDetailEntity;
}

@freezed
abstract class SeasonEntity with _$SeasonEntity {
  const factory SeasonEntity({
    int? seasonNumber,
    String? name,
    String? cover,
    String? overview,
    int? episodeCount,
    String? airDate,
  }) = _SeasonEntity;
}

@freezed
abstract class EpisodeEntity with _$EpisodeEntity {
  const factory EpisodeEntity({
    required String id,
    int? episodeNum,
    String? title,
    String? containerExtension,
    String? plot,
    String? image,
    String? releaseDate,
    double? rating,
    String? duration,
    int? season,
  }) = _EpisodeEntity;
}
