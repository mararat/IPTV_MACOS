// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VodModel _$VodModelFromJson(Map<String, dynamic> json) => _VodModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  posterUrl: json['posterUrl'] as String?,
  backdropUrl: json['backdropUrl'] as String?,
  categoryId: json['categoryId'] as String?,
  duration: json['duration'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  releaseYear: json['releaseYear'] as String?,
  genre: json['genre'] as String?,
  streamId: (json['streamId'] as num?)?.toInt() ?? 0,
  containerExtension: json['containerExtension'] as String?,
);

Map<String, dynamic> _$VodModelToJson(_VodModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'posterUrl': instance.posterUrl,
  'backdropUrl': instance.backdropUrl,
  'categoryId': instance.categoryId,
  'duration': instance.duration,
  'rating': instance.rating,
  'releaseYear': instance.releaseYear,
  'genre': instance.genre,
  'streamId': instance.streamId,
  'containerExtension': instance.containerExtension,
};
