// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xtream_live_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_XtreamLiveStream _$XtreamLiveStreamFromJson(Map<String, dynamic> json) =>
    _XtreamLiveStream(
      num: (json['num'] as num?)?.toInt(),
      name: json['name'] as String,
      streamType: json['stream_type'] as String?,
      streamId: (json['stream_id'] as num).toInt(),
      streamIcon: json['stream_icon'] as String?,
      epgChannelId: json['epg_channel_id'] as String?,
      added: json['added'] as String?,
      isAdult: json['is_adult'] as String?,
      categoryId: json['category_id'] as String?,
      customSid: json['custom_sid'] as String?,
      tvArchive: (json['tv_archive'] as num?)?.toInt(),
      directSource: json['direct_source'] as String?,
      tvArchiveDuration: (json['tv_archive_duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$XtreamLiveStreamToJson(_XtreamLiveStream instance) =>
    <String, dynamic>{
      'num': instance.num,
      'name': instance.name,
      'stream_type': instance.streamType,
      'stream_id': instance.streamId,
      'stream_icon': instance.streamIcon,
      'epg_channel_id': instance.epgChannelId,
      'added': instance.added,
      'is_adult': instance.isAdult,
      'category_id': instance.categoryId,
      'custom_sid': instance.customSid,
      'tv_archive': instance.tvArchive,
      'direct_source': instance.directSource,
      'tv_archive_duration': instance.tvArchiveDuration,
    };
