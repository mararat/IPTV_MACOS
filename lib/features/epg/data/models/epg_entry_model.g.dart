// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epg_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpgEntryModel _$EpgEntryModelFromJson(Map<String, dynamic> json) =>
    _EpgEntryModel(
      id: json['id'] as String,
      channelId: json['channelId'] as String,
      title: json['title'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      description: json['description'] as String?,
      genre: json['genre'] as String?,
      posterUrl: json['posterUrl'] as String?,
    );

Map<String, dynamic> _$EpgEntryModelToJson(_EpgEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'channelId': instance.channelId,
      'title': instance.title,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'description': instance.description,
      'genre': instance.genre,
      'posterUrl': instance.posterUrl,
    };
