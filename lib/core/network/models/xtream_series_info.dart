import 'package:freezed_annotation/freezed_annotation.dart';

part 'xtream_series_info.freezed.dart';
part 'xtream_series_info.g.dart';

@freezed
abstract class XtreamSeriesInfo with _$XtreamSeriesInfo {
  const factory XtreamSeriesInfo({
    Map<String, dynamic>? info,
    Map<String, List<XtreamEpisode>>? episodes,
    List<XtreamSeason>? seasons,
  }) = _XtreamSeriesInfo;

  factory XtreamSeriesInfo.fromJson(Map<String, dynamic> json) {
    final info = json['info'] as Map<String, dynamic>?;
    final seasonsRaw = json['seasons'] as List<dynamic>?;
    final episodesRaw = json['episodes'] as Map<String, dynamic>?;

    final seasons = seasonsRaw
        ?.map((e) => XtreamSeason.fromJson(e as Map<String, dynamic>))
        .toList();

    Map<String, List<XtreamEpisode>>? episodes;
    if (episodesRaw != null) {
      episodes = {};
      for (final entry in episodesRaw.entries) {
        final list = (entry.value as List<dynamic>)
            .map((e) => XtreamEpisode.fromJson(e as Map<String, dynamic>))
            .toList();
        episodes[entry.key] = list;
      }
    }

    return XtreamSeriesInfo(
      info: info,
      episodes: episodes,
      seasons: seasons,
    );
  }
}

@freezed
abstract class XtreamSeason with _$XtreamSeason {
  const factory XtreamSeason({
    @JsonKey(name: 'air_date') String? airDate,
    @JsonKey(name: 'episode_count') int? episodeCount,
    int? id,
    String? name,
    String? overview,
    @JsonKey(name: 'season_number') int? seasonNumber,
    String? cover,
    @JsonKey(name: 'cover_big') String? coverBig,
  }) = _XtreamSeason;

  factory XtreamSeason.fromJson(Map<String, dynamic> json) =>
      _$XtreamSeasonFromJson(json);
}

@freezed
abstract class XtreamEpisode with _$XtreamEpisode {
  const factory XtreamEpisode({
    String? id,
    @JsonKey(name: 'episode_num') int? episodeNum,
    String? title,
    @JsonKey(name: 'container_extension') String? containerExtension,
    XtreamEpisodeInfo? info,
    @JsonKey(name: 'custom_sid') String? customSid,
    String? added,
    int? season,
    @JsonKey(name: 'direct_source') String? directSource,
  }) = _XtreamEpisode;

  factory XtreamEpisode.fromJson(Map<String, dynamic> json) =>
      _$XtreamEpisodeFromJson(json);
}

@freezed
abstract class XtreamEpisodeInfo with _$XtreamEpisodeInfo {
  const factory XtreamEpisodeInfo({
    @JsonKey(name: 'movie_image') String? movieImage,
    String? plot,
    @JsonKey(name: 'release_date') String? releaseDate,
    double? rating,
    String? duration,
    @JsonKey(name: 'duration_secs') int? durationSecs,
    XtreamVideoInfo? video,
    XtreamAudioInfo? audio,
    int? bitrate,
  }) = _XtreamEpisodeInfo;

  factory XtreamEpisodeInfo.fromJson(Map<String, dynamic> json) =>
      _$XtreamEpisodeInfoFromJson(json);
}

@freezed
abstract class XtreamVideoInfo with _$XtreamVideoInfo {
  const factory XtreamVideoInfo({
    String? codec,
    String? width,
    String? height,
  }) = _XtreamVideoInfo;

  factory XtreamVideoInfo.fromJson(Map<String, dynamic> json) =>
      _$XtreamVideoInfoFromJson(json);
}

@freezed
abstract class XtreamAudioInfo with _$XtreamAudioInfo {
  const factory XtreamAudioInfo({
    String? codec,
    String? channels,
    @JsonKey(name: 'sample_rate') String? sampleRate,
  }) = _XtreamAudioInfo;

  factory XtreamAudioInfo.fromJson(Map<String, dynamic> json) =>
      _$XtreamAudioInfoFromJson(json);
}
