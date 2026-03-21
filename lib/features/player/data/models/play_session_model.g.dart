// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaySessionModel _$PlaySessionModelFromJson(Map<String, dynamic> json) =>
    _PlaySessionModel(
      playUrl: json['playUrl'] as String,
      playToken: json['playToken'] as String,
      expiresAt: json['expiresAt'] as String,
      headers:
          (json['headers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$PlaySessionModelToJson(_PlaySessionModel instance) =>
    <String, dynamic>{
      'playUrl': instance.playUrl,
      'playToken': instance.playToken,
      'expiresAt': instance.expiresAt,
      'headers': instance.headers,
    };
