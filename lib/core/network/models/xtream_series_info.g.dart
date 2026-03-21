// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xtream_series_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_XtreamSeason _$XtreamSeasonFromJson(Map<String, dynamic> json) =>
    _XtreamSeason(
      airDate: json['air_date'] as String?,
      episodeCount: (json['episode_count'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      seasonNumber: (json['season_number'] as num?)?.toInt(),
      cover: json['cover'] as String?,
      coverBig: json['cover_big'] as String?,
    );

Map<String, dynamic> _$XtreamSeasonToJson(_XtreamSeason instance) =>
    <String, dynamic>{
      'air_date': instance.airDate,
      'episode_count': instance.episodeCount,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'season_number': instance.seasonNumber,
      'cover': instance.cover,
      'cover_big': instance.coverBig,
    };

_XtreamEpisode _$XtreamEpisodeFromJson(Map<String, dynamic> json) =>
    _XtreamEpisode(
      id: json['id'] as String?,
      episodeNum: (json['episode_num'] as num?)?.toInt(),
      title: json['title'] as String?,
      containerExtension: json['container_extension'] as String?,
      info: json['info'] == null
          ? null
          : XtreamEpisodeInfo.fromJson(json['info'] as Map<String, dynamic>),
      customSid: json['custom_sid'] as String?,
      added: json['added'] as String?,
      season: (json['season'] as num?)?.toInt(),
      directSource: json['direct_source'] as String?,
    );

Map<String, dynamic> _$XtreamEpisodeToJson(_XtreamEpisode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'episode_num': instance.episodeNum,
      'title': instance.title,
      'container_extension': instance.containerExtension,
      'info': instance.info,
      'custom_sid': instance.customSid,
      'added': instance.added,
      'season': instance.season,
      'direct_source': instance.directSource,
    };

_XtreamEpisodeInfo _$XtreamEpisodeInfoFromJson(Map<String, dynamic> json) =>
    _XtreamEpisodeInfo(
      movieImage: json['movie_image'] as String?,
      plot: json['plot'] as String?,
      releaseDate: json['release_date'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      duration: json['duration'] as String?,
      durationSecs: (json['duration_secs'] as num?)?.toInt(),
      video: json['video'] == null
          ? null
          : XtreamVideoInfo.fromJson(json['video'] as Map<String, dynamic>),
      audio: json['audio'] == null
          ? null
          : XtreamAudioInfo.fromJson(json['audio'] as Map<String, dynamic>),
      bitrate: (json['bitrate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$XtreamEpisodeInfoToJson(_XtreamEpisodeInfo instance) =>
    <String, dynamic>{
      'movie_image': instance.movieImage,
      'plot': instance.plot,
      'release_date': instance.releaseDate,
      'rating': instance.rating,
      'duration': instance.duration,
      'duration_secs': instance.durationSecs,
      'video': instance.video,
      'audio': instance.audio,
      'bitrate': instance.bitrate,
    };

_XtreamVideoInfo _$XtreamVideoInfoFromJson(Map<String, dynamic> json) =>
    _XtreamVideoInfo(
      codec: json['codec'] as String?,
      width: json['width'] as String?,
      height: json['height'] as String?,
    );

Map<String, dynamic> _$XtreamVideoInfoToJson(_XtreamVideoInfo instance) =>
    <String, dynamic>{
      'codec': instance.codec,
      'width': instance.width,
      'height': instance.height,
    };

_XtreamAudioInfo _$XtreamAudioInfoFromJson(Map<String, dynamic> json) =>
    _XtreamAudioInfo(
      codec: json['codec'] as String?,
      channels: json['channels'] as String?,
      sampleRate: json['sample_rate'] as String?,
    );

Map<String, dynamic> _$XtreamAudioInfoToJson(_XtreamAudioInfo instance) =>
    <String, dynamic>{
      'codec': instance.codec,
      'channels': instance.channels,
      'sample_rate': instance.sampleRate,
    };
