// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChannelModel _$ChannelModelFromJson(Map<String, dynamic> json) =>
    _ChannelModel(
      id: json['id'] as String,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String?,
      categoryId: json['categoryId'] as String?,
      streamId: (json['streamId'] as num?)?.toInt() ?? 0,
      epgChannelId: json['epgChannelId'] as String?,
      tvArchive: (json['tvArchive'] as num?)?.toInt() ?? 0,
      tvArchiveDuration: (json['tvArchiveDuration'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChannelModelToJson(_ChannelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'categoryId': instance.categoryId,
      'streamId': instance.streamId,
      'epgChannelId': instance.epgChannelId,
      'tvArchive': instance.tvArchive,
      'tvArchiveDuration': instance.tvArchiveDuration,
    };
