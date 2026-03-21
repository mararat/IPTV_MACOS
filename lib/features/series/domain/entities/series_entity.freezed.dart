// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeriesEntity {

 int get seriesId; String get name; String? get cover; String? get plot; String? get cast; String? get director; String? get genre; String? get releaseDate; double? get rating; String? get categoryId; List<String> get backdropPath;
/// Create a copy of SeriesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesEntityCopyWith<SeriesEntity> get copyWith => _$SeriesEntityCopyWithImpl<SeriesEntity>(this as SeriesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesEntity&&(identical(other.seriesId, seriesId) || other.seriesId == seriesId)&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.cast, cast) || other.cast == cast)&&(identical(other.director, director) || other.director == director)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.backdropPath, backdropPath));
}


@override
int get hashCode => Object.hash(runtimeType,seriesId,name,cover,plot,cast,director,genre,releaseDate,rating,categoryId,const DeepCollectionEquality().hash(backdropPath));

@override
String toString() {
  return 'SeriesEntity(seriesId: $seriesId, name: $name, cover: $cover, plot: $plot, cast: $cast, director: $director, genre: $genre, releaseDate: $releaseDate, rating: $rating, categoryId: $categoryId, backdropPath: $backdropPath)';
}


}

/// @nodoc
abstract mixin class $SeriesEntityCopyWith<$Res>  {
  factory $SeriesEntityCopyWith(SeriesEntity value, $Res Function(SeriesEntity) _then) = _$SeriesEntityCopyWithImpl;
@useResult
$Res call({
 int seriesId, String name, String? cover, String? plot, String? cast, String? director, String? genre, String? releaseDate, double? rating, String? categoryId, List<String> backdropPath
});




}
/// @nodoc
class _$SeriesEntityCopyWithImpl<$Res>
    implements $SeriesEntityCopyWith<$Res> {
  _$SeriesEntityCopyWithImpl(this._self, this._then);

  final SeriesEntity _self;
  final $Res Function(SeriesEntity) _then;

/// Create a copy of SeriesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seriesId = null,Object? name = null,Object? cover = freezed,Object? plot = freezed,Object? cast = freezed,Object? director = freezed,Object? genre = freezed,Object? releaseDate = freezed,Object? rating = freezed,Object? categoryId = freezed,Object? backdropPath = null,}) {
  return _then(_self.copyWith(
seriesId: null == seriesId ? _self.seriesId : seriesId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,cast: freezed == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as String?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesEntity].
extension SeriesEntityPatterns on SeriesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesEntity value)  $default,){
final _that = this;
switch (_that) {
case _SeriesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int seriesId,  String name,  String? cover,  String? plot,  String? cast,  String? director,  String? genre,  String? releaseDate,  double? rating,  String? categoryId,  List<String> backdropPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesEntity() when $default != null:
return $default(_that.seriesId,_that.name,_that.cover,_that.plot,_that.cast,_that.director,_that.genre,_that.releaseDate,_that.rating,_that.categoryId,_that.backdropPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int seriesId,  String name,  String? cover,  String? plot,  String? cast,  String? director,  String? genre,  String? releaseDate,  double? rating,  String? categoryId,  List<String> backdropPath)  $default,) {final _that = this;
switch (_that) {
case _SeriesEntity():
return $default(_that.seriesId,_that.name,_that.cover,_that.plot,_that.cast,_that.director,_that.genre,_that.releaseDate,_that.rating,_that.categoryId,_that.backdropPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int seriesId,  String name,  String? cover,  String? plot,  String? cast,  String? director,  String? genre,  String? releaseDate,  double? rating,  String? categoryId,  List<String> backdropPath)?  $default,) {final _that = this;
switch (_that) {
case _SeriesEntity() when $default != null:
return $default(_that.seriesId,_that.name,_that.cover,_that.plot,_that.cast,_that.director,_that.genre,_that.releaseDate,_that.rating,_that.categoryId,_that.backdropPath);case _:
  return null;

}
}

}

/// @nodoc


class _SeriesEntity implements SeriesEntity {
  const _SeriesEntity({required this.seriesId, required this.name, this.cover, this.plot, this.cast, this.director, this.genre, this.releaseDate, this.rating, this.categoryId, final  List<String> backdropPath = const []}): _backdropPath = backdropPath;
  

@override final  int seriesId;
@override final  String name;
@override final  String? cover;
@override final  String? plot;
@override final  String? cast;
@override final  String? director;
@override final  String? genre;
@override final  String? releaseDate;
@override final  double? rating;
@override final  String? categoryId;
 final  List<String> _backdropPath;
@override@JsonKey() List<String> get backdropPath {
  if (_backdropPath is EqualUnmodifiableListView) return _backdropPath;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_backdropPath);
}


/// Create a copy of SeriesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesEntityCopyWith<_SeriesEntity> get copyWith => __$SeriesEntityCopyWithImpl<_SeriesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesEntity&&(identical(other.seriesId, seriesId) || other.seriesId == seriesId)&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.cast, cast) || other.cast == cast)&&(identical(other.director, director) || other.director == director)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other._backdropPath, _backdropPath));
}


@override
int get hashCode => Object.hash(runtimeType,seriesId,name,cover,plot,cast,director,genre,releaseDate,rating,categoryId,const DeepCollectionEquality().hash(_backdropPath));

@override
String toString() {
  return 'SeriesEntity(seriesId: $seriesId, name: $name, cover: $cover, plot: $plot, cast: $cast, director: $director, genre: $genre, releaseDate: $releaseDate, rating: $rating, categoryId: $categoryId, backdropPath: $backdropPath)';
}


}

/// @nodoc
abstract mixin class _$SeriesEntityCopyWith<$Res> implements $SeriesEntityCopyWith<$Res> {
  factory _$SeriesEntityCopyWith(_SeriesEntity value, $Res Function(_SeriesEntity) _then) = __$SeriesEntityCopyWithImpl;
@override @useResult
$Res call({
 int seriesId, String name, String? cover, String? plot, String? cast, String? director, String? genre, String? releaseDate, double? rating, String? categoryId, List<String> backdropPath
});




}
/// @nodoc
class __$SeriesEntityCopyWithImpl<$Res>
    implements _$SeriesEntityCopyWith<$Res> {
  __$SeriesEntityCopyWithImpl(this._self, this._then);

  final _SeriesEntity _self;
  final $Res Function(_SeriesEntity) _then;

/// Create a copy of SeriesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seriesId = null,Object? name = null,Object? cover = freezed,Object? plot = freezed,Object? cast = freezed,Object? director = freezed,Object? genre = freezed,Object? releaseDate = freezed,Object? rating = freezed,Object? categoryId = freezed,Object? backdropPath = null,}) {
  return _then(_SeriesEntity(
seriesId: null == seriesId ? _self.seriesId : seriesId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,cast: freezed == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as String?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: null == backdropPath ? _self._backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
