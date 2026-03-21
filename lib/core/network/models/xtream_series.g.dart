// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xtream_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_XtreamSeries _$XtreamSeriesFromJson(Map<String, dynamic> json) =>
    _XtreamSeries(
      num: (json['num'] as num?)?.toInt(),
      name: json['name'] as String,
      seriesId: (json['series_id'] as num).toInt(),
      cover: json['cover'] as String?,
      plot: json['plot'] as String?,
      cast: json['cast'] as String?,
      director: json['director'] as String?,
      genre: json['genre'] as String?,
      releaseDate: json['release_date'] as String?,
      lastModified: json['last_modified'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      rating5based: (json['rating_5based'] as num?)?.toDouble(),
      backdropPath: (json['backdrop_path'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      youtube: json['youtube'] as String?,
      episodeRunTime: json['episode_run_time'] as String?,
      categoryId: json['category_id'] as String?,
    );

Map<String, dynamic> _$XtreamSeriesToJson(_XtreamSeries instance) =>
    <String, dynamic>{
      'num': instance.num,
      'name': instance.name,
      'series_id': instance.seriesId,
      'cover': instance.cover,
      'plot': instance.plot,
      'cast': instance.cast,
      'director': instance.director,
      'genre': instance.genre,
      'release_date': instance.releaseDate,
      'last_modified': instance.lastModified,
      'rating': instance.rating,
      'rating_5based': instance.rating5based,
      'backdrop_path': instance.backdropPath,
      'youtube': instance.youtube,
      'episode_run_time': instance.episodeRunTime,
      'category_id': instance.categoryId,
    };
