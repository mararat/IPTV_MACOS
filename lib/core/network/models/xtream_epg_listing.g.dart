// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xtream_epg_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_XtreamEpgListing _$XtreamEpgListingFromJson(Map<String, dynamic> json) =>
    _XtreamEpgListing(
      id: json['id'] as String?,
      epgId: json['epg_id'] as String?,
      title: json['title'] as String?,
      lang: json['lang'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      description: json['description'] as String?,
      channelId: json['channel_id'] as String?,
      startTimestamp: json['start_timestamp'] as String?,
      stopTimestamp: json['stop_timestamp'] as String?,
      nowPlaying: (json['now_playing'] as num?)?.toInt(),
      hasArchive: (json['has_archive'] as num?)?.toInt(),
    );

Map<String, dynamic> _$XtreamEpgListingToJson(_XtreamEpgListing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'epg_id': instance.epgId,
      'title': instance.title,
      'lang': instance.lang,
      'start': instance.start,
      'end': instance.end,
      'description': instance.description,
      'channel_id': instance.channelId,
      'start_timestamp': instance.startTimestamp,
      'stop_timestamp': instance.stopTimestamp,
      'now_playing': instance.nowPlaying,
      'has_archive': instance.hasArchive,
    };
