// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xtream_vod_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_XtreamVodStream _$XtreamVodStreamFromJson(Map<String, dynamic> json) =>
    _XtreamVodStream(
      num: (json['num'] as num?)?.toInt(),
      name: json['name'] as String,
      streamType: json['stream_type'] as String?,
      streamId: (json['stream_id'] as num).toInt(),
      streamIcon: json['stream_icon'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      rating5based: (json['rating_5based'] as num?)?.toDouble(),
      added: json['added'] as String?,
      isAdult: json['is_adult'] as String?,
      categoryId: json['category_id'] as String?,
      containerExtension: json['container_extension'] as String?,
      customSid: json['custom_sid'] as String?,
      directSource: json['direct_source'] as String?,
    );

Map<String, dynamic> _$XtreamVodStreamToJson(_XtreamVodStream instance) =>
    <String, dynamic>{
      'num': instance.num,
      'name': instance.name,
      'stream_type': instance.streamType,
      'stream_id': instance.streamId,
      'stream_icon': instance.streamIcon,
      'rating': instance.rating,
      'rating_5based': instance.rating5based,
      'added': instance.added,
      'is_adult': instance.isAdult,
      'category_id': instance.categoryId,
      'container_extension': instance.containerExtension,
      'custom_sid': instance.customSid,
      'direct_source': instance.directSource,
    };
