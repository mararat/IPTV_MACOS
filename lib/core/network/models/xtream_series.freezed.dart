// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xtream_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XtreamSeries {

@JsonKey(name: 'num') int? get num; String get name;@JsonKey(name: 'series_id') int get seriesId; String? get cover; String? get plot; String? get cast; String? get director; String? get genre;@JsonKey(name: 'release_date') String? get releaseDate;@JsonKey(name: 'last_modified') String? get lastModified; double? get rating;@JsonKey(name: 'rating_5based') double? get rating5based;@JsonKey(name: 'backdrop_path') List<String>? get backdropPath; String? get youtube;@JsonKey(name: 'episode_run_time') String? get episodeRunTime;@JsonKey(name: 'category_id') String? get categoryId;
/// Create a copy of XtreamSeries
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamSeriesCopyWith<XtreamSeries> get copyWith => _$XtreamSeriesCopyWithImpl<XtreamSeries>(this as XtreamSeries, _$identity);

  /// Serializes this XtreamSeries to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamSeries&&(identical(other.num, num) || other.num == num)&&(identical(other.name, name) || other.name == name)&&(identical(other.seriesId, seriesId) || other.seriesId == seriesId)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.cast, cast) || other.cast == cast)&&(identical(other.director, director) || other.director == director)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.rating5based, rating5based) || other.rating5based == rating5based)&&const DeepCollectionEquality().equals(other.backdropPath, backdropPath)&&(identical(other.youtube, youtube) || other.youtube == youtube)&&(identical(other.episodeRunTime, episodeRunTime) || other.episodeRunTime == episodeRunTime)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,num,name,seriesId,cover,plot,cast,director,genre,releaseDate,lastModified,rating,rating5based,const DeepCollectionEquality().hash(backdropPath),youtube,episodeRunTime,categoryId);

@override
String toString() {
  return 'XtreamSeries(num: $num, name: $name, seriesId: $seriesId, cover: $cover, plot: $plot, cast: $cast, director: $director, genre: $genre, releaseDate: $releaseDate, lastModified: $lastModified, rating: $rating, rating5based: $rating5based, backdropPath: $backdropPath, youtube: $youtube, episodeRunTime: $episodeRunTime, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $XtreamSeriesCopyWith<$Res>  {
  factory $XtreamSeriesCopyWith(XtreamSeries value, $Res Function(XtreamSeries) _then) = _$XtreamSeriesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'num') int? num, String name,@JsonKey(name: 'series_id') int seriesId, String? cover, String? plot, String? cast, String? director, String? genre,@JsonKey(name: 'release_date') String? releaseDate,@JsonKey(name: 'last_modified') String? lastModified, double? rating,@JsonKey(name: 'rating_5based') double? rating5based,@JsonKey(name: 'backdrop_path') List<String>? backdropPath, String? youtube,@JsonKey(name: 'episode_run_time') String? episodeRunTime,@JsonKey(name: 'category_id') String? categoryId
});




}
/// @nodoc
class _$XtreamSeriesCopyWithImpl<$Res>
    implements $XtreamSeriesCopyWith<$Res> {
  _$XtreamSeriesCopyWithImpl(this._self, this._then);

  final XtreamSeries _self;
  final $Res Function(XtreamSeries) _then;

/// Create a copy of XtreamSeries
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? num = freezed,Object? name = null,Object? seriesId = null,Object? cover = freezed,Object? plot = freezed,Object? cast = freezed,Object? director = freezed,Object? genre = freezed,Object? releaseDate = freezed,Object? lastModified = freezed,Object? rating = freezed,Object? rating5based = freezed,Object? backdropPath = freezed,Object? youtube = freezed,Object? episodeRunTime = freezed,Object? categoryId = freezed,}) {
  return _then(_self.copyWith(
num: freezed == num ? _self.num : num // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,seriesId: null == seriesId ? _self.seriesId : seriesId // ignore: cast_nullable_to_non_nullable
as int,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,cast: freezed == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as String?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,lastModified: freezed == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,rating5based: freezed == rating5based ? _self.rating5based : rating5based // ignore: cast_nullable_to_non_nullable
as double?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as List<String>?,youtube: freezed == youtube ? _self.youtube : youtube // ignore: cast_nullable_to_non_nullable
as String?,episodeRunTime: freezed == episodeRunTime ? _self.episodeRunTime : episodeRunTime // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamSeries].
extension XtreamSeriesPatterns on XtreamSeries {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamSeries value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamSeries() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamSeries value)  $default,){
final _that = this;
switch (_that) {
case _XtreamSeries():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamSeries value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamSeries() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'num')  int? num,  String name, @JsonKey(name: 'series_id')  int seriesId,  String? cover,  String? plot,  String? cast,  String? director,  String? genre, @JsonKey(name: 'release_date')  String? releaseDate, @JsonKey(name: 'last_modified')  String? lastModified,  double? rating, @JsonKey(name: 'rating_5based')  double? rating5based, @JsonKey(name: 'backdrop_path')  List<String>? backdropPath,  String? youtube, @JsonKey(name: 'episode_run_time')  String? episodeRunTime, @JsonKey(name: 'category_id')  String? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamSeries() when $default != null:
return $default(_that.num,_that.name,_that.seriesId,_that.cover,_that.plot,_that.cast,_that.director,_that.genre,_that.releaseDate,_that.lastModified,_that.rating,_that.rating5based,_that.backdropPath,_that.youtube,_that.episodeRunTime,_that.categoryId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'num')  int? num,  String name, @JsonKey(name: 'series_id')  int seriesId,  String? cover,  String? plot,  String? cast,  String? director,  String? genre, @JsonKey(name: 'release_date')  String? releaseDate, @JsonKey(name: 'last_modified')  String? lastModified,  double? rating, @JsonKey(name: 'rating_5based')  double? rating5based, @JsonKey(name: 'backdrop_path')  List<String>? backdropPath,  String? youtube, @JsonKey(name: 'episode_run_time')  String? episodeRunTime, @JsonKey(name: 'category_id')  String? categoryId)  $default,) {final _that = this;
switch (_that) {
case _XtreamSeries():
return $default(_that.num,_that.name,_that.seriesId,_that.cover,_that.plot,_that.cast,_that.director,_that.genre,_that.releaseDate,_that.lastModified,_that.rating,_that.rating5based,_that.backdropPath,_that.youtube,_that.episodeRunTime,_that.categoryId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'num')  int? num,  String name, @JsonKey(name: 'series_id')  int seriesId,  String? cover,  String? plot,  String? cast,  String? director,  String? genre, @JsonKey(name: 'release_date')  String? releaseDate, @JsonKey(name: 'last_modified')  String? lastModified,  double? rating, @JsonKey(name: 'rating_5based')  double? rating5based, @JsonKey(name: 'backdrop_path')  List<String>? backdropPath,  String? youtube, @JsonKey(name: 'episode_run_time')  String? episodeRunTime, @JsonKey(name: 'category_id')  String? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _XtreamSeries() when $default != null:
return $default(_that.num,_that.name,_that.seriesId,_that.cover,_that.plot,_that.cast,_that.director,_that.genre,_that.releaseDate,_that.lastModified,_that.rating,_that.rating5based,_that.backdropPath,_that.youtube,_that.episodeRunTime,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamSeries implements XtreamSeries {
  const _XtreamSeries({@JsonKey(name: 'num') this.num, required this.name, @JsonKey(name: 'series_id') required this.seriesId, this.cover, this.plot, this.cast, this.director, this.genre, @JsonKey(name: 'release_date') this.releaseDate, @JsonKey(name: 'last_modified') this.lastModified, this.rating, @JsonKey(name: 'rating_5based') this.rating5based, @JsonKey(name: 'backdrop_path') final  List<String>? backdropPath, this.youtube, @JsonKey(name: 'episode_run_time') this.episodeRunTime, @JsonKey(name: 'category_id') this.categoryId}): _backdropPath = backdropPath;
  factory _XtreamSeries.fromJson(Map<String, dynamic> json) => _$XtreamSeriesFromJson(json);

@override@JsonKey(name: 'num') final  int? num;
@override final  String name;
@override@JsonKey(name: 'series_id') final  int seriesId;
@override final  String? cover;
@override final  String? plot;
@override final  String? cast;
@override final  String? director;
@override final  String? genre;
@override@JsonKey(name: 'release_date') final  String? releaseDate;
@override@JsonKey(name: 'last_modified') final  String? lastModified;
@override final  double? rating;
@override@JsonKey(name: 'rating_5based') final  double? rating5based;
 final  List<String>? _backdropPath;
@override@JsonKey(name: 'backdrop_path') List<String>? get backdropPath {
  final value = _backdropPath;
  if (value == null) return null;
  if (_backdropPath is EqualUnmodifiableListView) return _backdropPath;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? youtube;
@override@JsonKey(name: 'episode_run_time') final  String? episodeRunTime;
@override@JsonKey(name: 'category_id') final  String? categoryId;

/// Create a copy of XtreamSeries
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamSeriesCopyWith<_XtreamSeries> get copyWith => __$XtreamSeriesCopyWithImpl<_XtreamSeries>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamSeriesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamSeries&&(identical(other.num, num) || other.num == num)&&(identical(other.name, name) || other.name == name)&&(identical(other.seriesId, seriesId) || other.seriesId == seriesId)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.cast, cast) || other.cast == cast)&&(identical(other.director, director) || other.director == director)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.rating5based, rating5based) || other.rating5based == rating5based)&&const DeepCollectionEquality().equals(other._backdropPath, _backdropPath)&&(identical(other.youtube, youtube) || other.youtube == youtube)&&(identical(other.episodeRunTime, episodeRunTime) || other.episodeRunTime == episodeRunTime)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,num,name,seriesId,cover,plot,cast,director,genre,releaseDate,lastModified,rating,rating5based,const DeepCollectionEquality().hash(_backdropPath),youtube,episodeRunTime,categoryId);

@override
String toString() {
  return 'XtreamSeries(num: $num, name: $name, seriesId: $seriesId, cover: $cover, plot: $plot, cast: $cast, director: $director, genre: $genre, releaseDate: $releaseDate, lastModified: $lastModified, rating: $rating, rating5based: $rating5based, backdropPath: $backdropPath, youtube: $youtube, episodeRunTime: $episodeRunTime, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$XtreamSeriesCopyWith<$Res> implements $XtreamSeriesCopyWith<$Res> {
  factory _$XtreamSeriesCopyWith(_XtreamSeries value, $Res Function(_XtreamSeries) _then) = __$XtreamSeriesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'num') int? num, String name,@JsonKey(name: 'series_id') int seriesId, String? cover, String? plot, String? cast, String? director, String? genre,@JsonKey(name: 'release_date') String? releaseDate,@JsonKey(name: 'last_modified') String? lastModified, double? rating,@JsonKey(name: 'rating_5based') double? rating5based,@JsonKey(name: 'backdrop_path') List<String>? backdropPath, String? youtube,@JsonKey(name: 'episode_run_time') String? episodeRunTime,@JsonKey(name: 'category_id') String? categoryId
});




}
/// @nodoc
class __$XtreamSeriesCopyWithImpl<$Res>
    implements _$XtreamSeriesCopyWith<$Res> {
  __$XtreamSeriesCopyWithImpl(this._self, this._then);

  final _XtreamSeries _self;
  final $Res Function(_XtreamSeries) _then;

/// Create a copy of XtreamSeries
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? num = freezed,Object? name = null,Object? seriesId = null,Object? cover = freezed,Object? plot = freezed,Object? cast = freezed,Object? director = freezed,Object? genre = freezed,Object? releaseDate = freezed,Object? lastModified = freezed,Object? rating = freezed,Object? rating5based = freezed,Object? backdropPath = freezed,Object? youtube = freezed,Object? episodeRunTime = freezed,Object? categoryId = freezed,}) {
  return _then(_XtreamSeries(
num: freezed == num ? _self.num : num // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,seriesId: null == seriesId ? _self.seriesId : seriesId // ignore: cast_nullable_to_non_nullable
as int,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,cast: freezed == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as String?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,lastModified: freezed == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,rating5based: freezed == rating5based ? _self.rating5based : rating5based // ignore: cast_nullable_to_non_nullable
as double?,backdropPath: freezed == backdropPath ? _self._backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as List<String>?,youtube: freezed == youtube ? _self.youtube : youtube // ignore: cast_nullable_to_non_nullable
as String?,episodeRunTime: freezed == episodeRunTime ? _self.episodeRunTime : episodeRunTime // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
