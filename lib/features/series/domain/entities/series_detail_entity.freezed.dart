// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeriesDetailEntity {

 String get name; String? get cover; String? get plot; String? get cast; String? get director; String? get genre; String? get releaseDate; double? get rating; List<SeasonEntity> get seasons; Map<String, List<EpisodeEntity>> get episodes;
/// Create a copy of SeriesDetailEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesDetailEntityCopyWith<SeriesDetailEntity> get copyWith => _$SeriesDetailEntityCopyWithImpl<SeriesDetailEntity>(this as SeriesDetailEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesDetailEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.cast, cast) || other.cast == cast)&&(identical(other.director, director) || other.director == director)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.seasons, seasons)&&const DeepCollectionEquality().equals(other.episodes, episodes));
}


@override
int get hashCode => Object.hash(runtimeType,name,cover,plot,cast,director,genre,releaseDate,rating,const DeepCollectionEquality().hash(seasons),const DeepCollectionEquality().hash(episodes));

@override
String toString() {
  return 'SeriesDetailEntity(name: $name, cover: $cover, plot: $plot, cast: $cast, director: $director, genre: $genre, releaseDate: $releaseDate, rating: $rating, seasons: $seasons, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class $SeriesDetailEntityCopyWith<$Res>  {
  factory $SeriesDetailEntityCopyWith(SeriesDetailEntity value, $Res Function(SeriesDetailEntity) _then) = _$SeriesDetailEntityCopyWithImpl;
@useResult
$Res call({
 String name, String? cover, String? plot, String? cast, String? director, String? genre, String? releaseDate, double? rating, List<SeasonEntity> seasons, Map<String, List<EpisodeEntity>> episodes
});




}
/// @nodoc
class _$SeriesDetailEntityCopyWithImpl<$Res>
    implements $SeriesDetailEntityCopyWith<$Res> {
  _$SeriesDetailEntityCopyWithImpl(this._self, this._then);

  final SeriesDetailEntity _self;
  final $Res Function(SeriesDetailEntity) _then;

/// Create a copy of SeriesDetailEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? cover = freezed,Object? plot = freezed,Object? cast = freezed,Object? director = freezed,Object? genre = freezed,Object? releaseDate = freezed,Object? rating = freezed,Object? seasons = null,Object? episodes = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,cast: freezed == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as String?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,seasons: null == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeasonEntity>,episodes: null == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as Map<String, List<EpisodeEntity>>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesDetailEntity].
extension SeriesDetailEntityPatterns on SeriesDetailEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesDetailEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesDetailEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesDetailEntity value)  $default,){
final _that = this;
switch (_that) {
case _SeriesDetailEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesDetailEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesDetailEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? cover,  String? plot,  String? cast,  String? director,  String? genre,  String? releaseDate,  double? rating,  List<SeasonEntity> seasons,  Map<String, List<EpisodeEntity>> episodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesDetailEntity() when $default != null:
return $default(_that.name,_that.cover,_that.plot,_that.cast,_that.director,_that.genre,_that.releaseDate,_that.rating,_that.seasons,_that.episodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? cover,  String? plot,  String? cast,  String? director,  String? genre,  String? releaseDate,  double? rating,  List<SeasonEntity> seasons,  Map<String, List<EpisodeEntity>> episodes)  $default,) {final _that = this;
switch (_that) {
case _SeriesDetailEntity():
return $default(_that.name,_that.cover,_that.plot,_that.cast,_that.director,_that.genre,_that.releaseDate,_that.rating,_that.seasons,_that.episodes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? cover,  String? plot,  String? cast,  String? director,  String? genre,  String? releaseDate,  double? rating,  List<SeasonEntity> seasons,  Map<String, List<EpisodeEntity>> episodes)?  $default,) {final _that = this;
switch (_that) {
case _SeriesDetailEntity() when $default != null:
return $default(_that.name,_that.cover,_that.plot,_that.cast,_that.director,_that.genre,_that.releaseDate,_that.rating,_that.seasons,_that.episodes);case _:
  return null;

}
}

}

/// @nodoc


class _SeriesDetailEntity implements SeriesDetailEntity {
  const _SeriesDetailEntity({required this.name, this.cover, this.plot, this.cast, this.director, this.genre, this.releaseDate, this.rating, final  List<SeasonEntity> seasons = const [], final  Map<String, List<EpisodeEntity>> episodes = const {}}): _seasons = seasons,_episodes = episodes;
  

@override final  String name;
@override final  String? cover;
@override final  String? plot;
@override final  String? cast;
@override final  String? director;
@override final  String? genre;
@override final  String? releaseDate;
@override final  double? rating;
 final  List<SeasonEntity> _seasons;
@override@JsonKey() List<SeasonEntity> get seasons {
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seasons);
}

 final  Map<String, List<EpisodeEntity>> _episodes;
@override@JsonKey() Map<String, List<EpisodeEntity>> get episodes {
  if (_episodes is EqualUnmodifiableMapView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_episodes);
}


/// Create a copy of SeriesDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesDetailEntityCopyWith<_SeriesDetailEntity> get copyWith => __$SeriesDetailEntityCopyWithImpl<_SeriesDetailEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesDetailEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.cast, cast) || other.cast == cast)&&(identical(other.director, director) || other.director == director)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other._seasons, _seasons)&&const DeepCollectionEquality().equals(other._episodes, _episodes));
}


@override
int get hashCode => Object.hash(runtimeType,name,cover,plot,cast,director,genre,releaseDate,rating,const DeepCollectionEquality().hash(_seasons),const DeepCollectionEquality().hash(_episodes));

@override
String toString() {
  return 'SeriesDetailEntity(name: $name, cover: $cover, plot: $plot, cast: $cast, director: $director, genre: $genre, releaseDate: $releaseDate, rating: $rating, seasons: $seasons, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class _$SeriesDetailEntityCopyWith<$Res> implements $SeriesDetailEntityCopyWith<$Res> {
  factory _$SeriesDetailEntityCopyWith(_SeriesDetailEntity value, $Res Function(_SeriesDetailEntity) _then) = __$SeriesDetailEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String? cover, String? plot, String? cast, String? director, String? genre, String? releaseDate, double? rating, List<SeasonEntity> seasons, Map<String, List<EpisodeEntity>> episodes
});




}
/// @nodoc
class __$SeriesDetailEntityCopyWithImpl<$Res>
    implements _$SeriesDetailEntityCopyWith<$Res> {
  __$SeriesDetailEntityCopyWithImpl(this._self, this._then);

  final _SeriesDetailEntity _self;
  final $Res Function(_SeriesDetailEntity) _then;

/// Create a copy of SeriesDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? cover = freezed,Object? plot = freezed,Object? cast = freezed,Object? director = freezed,Object? genre = freezed,Object? releaseDate = freezed,Object? rating = freezed,Object? seasons = null,Object? episodes = null,}) {
  return _then(_SeriesDetailEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,cast: freezed == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as String?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,seasons: null == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeasonEntity>,episodes: null == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as Map<String, List<EpisodeEntity>>,
  ));
}


}

/// @nodoc
mixin _$SeasonEntity {

 int? get seasonNumber; String? get name; String? get cover; String? get overview; int? get episodeCount; String? get airDate;
/// Create a copy of SeasonEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonEntityCopyWith<SeasonEntity> get copyWith => _$SeasonEntityCopyWithImpl<SeasonEntity>(this as SeasonEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeasonEntity&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.airDate, airDate) || other.airDate == airDate));
}


@override
int get hashCode => Object.hash(runtimeType,seasonNumber,name,cover,overview,episodeCount,airDate);

@override
String toString() {
  return 'SeasonEntity(seasonNumber: $seasonNumber, name: $name, cover: $cover, overview: $overview, episodeCount: $episodeCount, airDate: $airDate)';
}


}

/// @nodoc
abstract mixin class $SeasonEntityCopyWith<$Res>  {
  factory $SeasonEntityCopyWith(SeasonEntity value, $Res Function(SeasonEntity) _then) = _$SeasonEntityCopyWithImpl;
@useResult
$Res call({
 int? seasonNumber, String? name, String? cover, String? overview, int? episodeCount, String? airDate
});




}
/// @nodoc
class _$SeasonEntityCopyWithImpl<$Res>
    implements $SeasonEntityCopyWith<$Res> {
  _$SeasonEntityCopyWithImpl(this._self, this._then);

  final SeasonEntity _self;
  final $Res Function(SeasonEntity) _then;

/// Create a copy of SeasonEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seasonNumber = freezed,Object? name = freezed,Object? cover = freezed,Object? overview = freezed,Object? episodeCount = freezed,Object? airDate = freezed,}) {
  return _then(_self.copyWith(
seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,episodeCount: freezed == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int?,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeasonEntity].
extension SeasonEntityPatterns on SeasonEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeasonEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeasonEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeasonEntity value)  $default,){
final _that = this;
switch (_that) {
case _SeasonEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeasonEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SeasonEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? seasonNumber,  String? name,  String? cover,  String? overview,  int? episodeCount,  String? airDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeasonEntity() when $default != null:
return $default(_that.seasonNumber,_that.name,_that.cover,_that.overview,_that.episodeCount,_that.airDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? seasonNumber,  String? name,  String? cover,  String? overview,  int? episodeCount,  String? airDate)  $default,) {final _that = this;
switch (_that) {
case _SeasonEntity():
return $default(_that.seasonNumber,_that.name,_that.cover,_that.overview,_that.episodeCount,_that.airDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? seasonNumber,  String? name,  String? cover,  String? overview,  int? episodeCount,  String? airDate)?  $default,) {final _that = this;
switch (_that) {
case _SeasonEntity() when $default != null:
return $default(_that.seasonNumber,_that.name,_that.cover,_that.overview,_that.episodeCount,_that.airDate);case _:
  return null;

}
}

}

/// @nodoc


class _SeasonEntity implements SeasonEntity {
  const _SeasonEntity({this.seasonNumber, this.name, this.cover, this.overview, this.episodeCount, this.airDate});
  

@override final  int? seasonNumber;
@override final  String? name;
@override final  String? cover;
@override final  String? overview;
@override final  int? episodeCount;
@override final  String? airDate;

/// Create a copy of SeasonEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonEntityCopyWith<_SeasonEntity> get copyWith => __$SeasonEntityCopyWithImpl<_SeasonEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeasonEntity&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.airDate, airDate) || other.airDate == airDate));
}


@override
int get hashCode => Object.hash(runtimeType,seasonNumber,name,cover,overview,episodeCount,airDate);

@override
String toString() {
  return 'SeasonEntity(seasonNumber: $seasonNumber, name: $name, cover: $cover, overview: $overview, episodeCount: $episodeCount, airDate: $airDate)';
}


}

/// @nodoc
abstract mixin class _$SeasonEntityCopyWith<$Res> implements $SeasonEntityCopyWith<$Res> {
  factory _$SeasonEntityCopyWith(_SeasonEntity value, $Res Function(_SeasonEntity) _then) = __$SeasonEntityCopyWithImpl;
@override @useResult
$Res call({
 int? seasonNumber, String? name, String? cover, String? overview, int? episodeCount, String? airDate
});




}
/// @nodoc
class __$SeasonEntityCopyWithImpl<$Res>
    implements _$SeasonEntityCopyWith<$Res> {
  __$SeasonEntityCopyWithImpl(this._self, this._then);

  final _SeasonEntity _self;
  final $Res Function(_SeasonEntity) _then;

/// Create a copy of SeasonEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seasonNumber = freezed,Object? name = freezed,Object? cover = freezed,Object? overview = freezed,Object? episodeCount = freezed,Object? airDate = freezed,}) {
  return _then(_SeasonEntity(
seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,episodeCount: freezed == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int?,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$EpisodeEntity {

 String get id; int? get episodeNum; String? get title; String? get containerExtension; String? get plot; String? get image; String? get releaseDate; double? get rating; String? get duration; int? get season;
/// Create a copy of EpisodeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeEntityCopyWith<EpisodeEntity> get copyWith => _$EpisodeEntityCopyWithImpl<EpisodeEntity>(this as EpisodeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeNum, episodeNum) || other.episodeNum == episodeNum)&&(identical(other.title, title) || other.title == title)&&(identical(other.containerExtension, containerExtension) || other.containerExtension == containerExtension)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.image, image) || other.image == image)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.season, season) || other.season == season));
}


@override
int get hashCode => Object.hash(runtimeType,id,episodeNum,title,containerExtension,plot,image,releaseDate,rating,duration,season);

@override
String toString() {
  return 'EpisodeEntity(id: $id, episodeNum: $episodeNum, title: $title, containerExtension: $containerExtension, plot: $plot, image: $image, releaseDate: $releaseDate, rating: $rating, duration: $duration, season: $season)';
}


}

/// @nodoc
abstract mixin class $EpisodeEntityCopyWith<$Res>  {
  factory $EpisodeEntityCopyWith(EpisodeEntity value, $Res Function(EpisodeEntity) _then) = _$EpisodeEntityCopyWithImpl;
@useResult
$Res call({
 String id, int? episodeNum, String? title, String? containerExtension, String? plot, String? image, String? releaseDate, double? rating, String? duration, int? season
});




}
/// @nodoc
class _$EpisodeEntityCopyWithImpl<$Res>
    implements $EpisodeEntityCopyWith<$Res> {
  _$EpisodeEntityCopyWithImpl(this._self, this._then);

  final EpisodeEntity _self;
  final $Res Function(EpisodeEntity) _then;

/// Create a copy of EpisodeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? episodeNum = freezed,Object? title = freezed,Object? containerExtension = freezed,Object? plot = freezed,Object? image = freezed,Object? releaseDate = freezed,Object? rating = freezed,Object? duration = freezed,Object? season = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,episodeNum: freezed == episodeNum ? _self.episodeNum : episodeNum // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,containerExtension: freezed == containerExtension ? _self.containerExtension : containerExtension // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [EpisodeEntity].
extension EpisodeEntityPatterns on EpisodeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodeEntity value)  $default,){
final _that = this;
switch (_that) {
case _EpisodeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int? episodeNum,  String? title,  String? containerExtension,  String? plot,  String? image,  String? releaseDate,  double? rating,  String? duration,  int? season)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpisodeEntity() when $default != null:
return $default(_that.id,_that.episodeNum,_that.title,_that.containerExtension,_that.plot,_that.image,_that.releaseDate,_that.rating,_that.duration,_that.season);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int? episodeNum,  String? title,  String? containerExtension,  String? plot,  String? image,  String? releaseDate,  double? rating,  String? duration,  int? season)  $default,) {final _that = this;
switch (_that) {
case _EpisodeEntity():
return $default(_that.id,_that.episodeNum,_that.title,_that.containerExtension,_that.plot,_that.image,_that.releaseDate,_that.rating,_that.duration,_that.season);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int? episodeNum,  String? title,  String? containerExtension,  String? plot,  String? image,  String? releaseDate,  double? rating,  String? duration,  int? season)?  $default,) {final _that = this;
switch (_that) {
case _EpisodeEntity() when $default != null:
return $default(_that.id,_that.episodeNum,_that.title,_that.containerExtension,_that.plot,_that.image,_that.releaseDate,_that.rating,_that.duration,_that.season);case _:
  return null;

}
}

}

/// @nodoc


class _EpisodeEntity implements EpisodeEntity {
  const _EpisodeEntity({required this.id, this.episodeNum, this.title, this.containerExtension, this.plot, this.image, this.releaseDate, this.rating, this.duration, this.season});
  

@override final  String id;
@override final  int? episodeNum;
@override final  String? title;
@override final  String? containerExtension;
@override final  String? plot;
@override final  String? image;
@override final  String? releaseDate;
@override final  double? rating;
@override final  String? duration;
@override final  int? season;

/// Create a copy of EpisodeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeEntityCopyWith<_EpisodeEntity> get copyWith => __$EpisodeEntityCopyWithImpl<_EpisodeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeNum, episodeNum) || other.episodeNum == episodeNum)&&(identical(other.title, title) || other.title == title)&&(identical(other.containerExtension, containerExtension) || other.containerExtension == containerExtension)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.image, image) || other.image == image)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.season, season) || other.season == season));
}


@override
int get hashCode => Object.hash(runtimeType,id,episodeNum,title,containerExtension,plot,image,releaseDate,rating,duration,season);

@override
String toString() {
  return 'EpisodeEntity(id: $id, episodeNum: $episodeNum, title: $title, containerExtension: $containerExtension, plot: $plot, image: $image, releaseDate: $releaseDate, rating: $rating, duration: $duration, season: $season)';
}


}

/// @nodoc
abstract mixin class _$EpisodeEntityCopyWith<$Res> implements $EpisodeEntityCopyWith<$Res> {
  factory _$EpisodeEntityCopyWith(_EpisodeEntity value, $Res Function(_EpisodeEntity) _then) = __$EpisodeEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, int? episodeNum, String? title, String? containerExtension, String? plot, String? image, String? releaseDate, double? rating, String? duration, int? season
});




}
/// @nodoc
class __$EpisodeEntityCopyWithImpl<$Res>
    implements _$EpisodeEntityCopyWith<$Res> {
  __$EpisodeEntityCopyWithImpl(this._self, this._then);

  final _EpisodeEntity _self;
  final $Res Function(_EpisodeEntity) _then;

/// Create a copy of EpisodeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? episodeNum = freezed,Object? title = freezed,Object? containerExtension = freezed,Object? plot = freezed,Object? image = freezed,Object? releaseDate = freezed,Object? rating = freezed,Object? duration = freezed,Object? season = freezed,}) {
  return _then(_EpisodeEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,episodeNum: freezed == episodeNum ? _self.episodeNum : episodeNum // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,containerExtension: freezed == containerExtension ? _self.containerExtension : containerExtension // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
