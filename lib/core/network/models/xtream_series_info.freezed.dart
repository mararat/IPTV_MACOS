// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xtream_series_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$XtreamSeriesInfo {

 Map<String, dynamic>? get info; Map<String, List<XtreamEpisode>>? get episodes; List<XtreamSeason>? get seasons;
/// Create a copy of XtreamSeriesInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamSeriesInfoCopyWith<XtreamSeriesInfo> get copyWith => _$XtreamSeriesInfoCopyWithImpl<XtreamSeriesInfo>(this as XtreamSeriesInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamSeriesInfo&&const DeepCollectionEquality().equals(other.info, info)&&const DeepCollectionEquality().equals(other.episodes, episodes)&&const DeepCollectionEquality().equals(other.seasons, seasons));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(info),const DeepCollectionEquality().hash(episodes),const DeepCollectionEquality().hash(seasons));

@override
String toString() {
  return 'XtreamSeriesInfo(info: $info, episodes: $episodes, seasons: $seasons)';
}


}

/// @nodoc
abstract mixin class $XtreamSeriesInfoCopyWith<$Res>  {
  factory $XtreamSeriesInfoCopyWith(XtreamSeriesInfo value, $Res Function(XtreamSeriesInfo) _then) = _$XtreamSeriesInfoCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic>? info, Map<String, List<XtreamEpisode>>? episodes, List<XtreamSeason>? seasons
});




}
/// @nodoc
class _$XtreamSeriesInfoCopyWithImpl<$Res>
    implements $XtreamSeriesInfoCopyWith<$Res> {
  _$XtreamSeriesInfoCopyWithImpl(this._self, this._then);

  final XtreamSeriesInfo _self;
  final $Res Function(XtreamSeriesInfo) _then;

/// Create a copy of XtreamSeriesInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = freezed,Object? episodes = freezed,Object? seasons = freezed,}) {
  return _then(_self.copyWith(
info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as Map<String, List<XtreamEpisode>>?,seasons: freezed == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<XtreamSeason>?,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamSeriesInfo].
extension XtreamSeriesInfoPatterns on XtreamSeriesInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamSeriesInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamSeriesInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamSeriesInfo value)  $default,){
final _that = this;
switch (_that) {
case _XtreamSeriesInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamSeriesInfo value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamSeriesInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic>? info,  Map<String, List<XtreamEpisode>>? episodes,  List<XtreamSeason>? seasons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamSeriesInfo() when $default != null:
return $default(_that.info,_that.episodes,_that.seasons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic>? info,  Map<String, List<XtreamEpisode>>? episodes,  List<XtreamSeason>? seasons)  $default,) {final _that = this;
switch (_that) {
case _XtreamSeriesInfo():
return $default(_that.info,_that.episodes,_that.seasons);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic>? info,  Map<String, List<XtreamEpisode>>? episodes,  List<XtreamSeason>? seasons)?  $default,) {final _that = this;
switch (_that) {
case _XtreamSeriesInfo() when $default != null:
return $default(_that.info,_that.episodes,_that.seasons);case _:
  return null;

}
}

}

/// @nodoc


class _XtreamSeriesInfo implements XtreamSeriesInfo {
  const _XtreamSeriesInfo({final  Map<String, dynamic>? info, final  Map<String, List<XtreamEpisode>>? episodes, final  List<XtreamSeason>? seasons}): _info = info,_episodes = episodes,_seasons = seasons;
  

 final  Map<String, dynamic>? _info;
@override Map<String, dynamic>? get info {
  final value = _info;
  if (value == null) return null;
  if (_info is EqualUnmodifiableMapView) return _info;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, List<XtreamEpisode>>? _episodes;
@override Map<String, List<XtreamEpisode>>? get episodes {
  final value = _episodes;
  if (value == null) return null;
  if (_episodes is EqualUnmodifiableMapView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<XtreamSeason>? _seasons;
@override List<XtreamSeason>? get seasons {
  final value = _seasons;
  if (value == null) return null;
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of XtreamSeriesInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamSeriesInfoCopyWith<_XtreamSeriesInfo> get copyWith => __$XtreamSeriesInfoCopyWithImpl<_XtreamSeriesInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamSeriesInfo&&const DeepCollectionEquality().equals(other._info, _info)&&const DeepCollectionEquality().equals(other._episodes, _episodes)&&const DeepCollectionEquality().equals(other._seasons, _seasons));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_info),const DeepCollectionEquality().hash(_episodes),const DeepCollectionEquality().hash(_seasons));

@override
String toString() {
  return 'XtreamSeriesInfo(info: $info, episodes: $episodes, seasons: $seasons)';
}


}

/// @nodoc
abstract mixin class _$XtreamSeriesInfoCopyWith<$Res> implements $XtreamSeriesInfoCopyWith<$Res> {
  factory _$XtreamSeriesInfoCopyWith(_XtreamSeriesInfo value, $Res Function(_XtreamSeriesInfo) _then) = __$XtreamSeriesInfoCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic>? info, Map<String, List<XtreamEpisode>>? episodes, List<XtreamSeason>? seasons
});




}
/// @nodoc
class __$XtreamSeriesInfoCopyWithImpl<$Res>
    implements _$XtreamSeriesInfoCopyWith<$Res> {
  __$XtreamSeriesInfoCopyWithImpl(this._self, this._then);

  final _XtreamSeriesInfo _self;
  final $Res Function(_XtreamSeriesInfo) _then;

/// Create a copy of XtreamSeriesInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = freezed,Object? episodes = freezed,Object? seasons = freezed,}) {
  return _then(_XtreamSeriesInfo(
info: freezed == info ? _self._info : info // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,episodes: freezed == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as Map<String, List<XtreamEpisode>>?,seasons: freezed == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<XtreamSeason>?,
  ));
}


}


/// @nodoc
mixin _$XtreamSeason {

@JsonKey(name: 'air_date') String? get airDate;@JsonKey(name: 'episode_count') int? get episodeCount; int? get id; String? get name; String? get overview;@JsonKey(name: 'season_number') int? get seasonNumber; String? get cover;@JsonKey(name: 'cover_big') String? get coverBig;
/// Create a copy of XtreamSeason
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamSeasonCopyWith<XtreamSeason> get copyWith => _$XtreamSeasonCopyWithImpl<XtreamSeason>(this as XtreamSeason, _$identity);

  /// Serializes this XtreamSeason to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamSeason&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.coverBig, coverBig) || other.coverBig == coverBig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airDate,episodeCount,id,name,overview,seasonNumber,cover,coverBig);

@override
String toString() {
  return 'XtreamSeason(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, seasonNumber: $seasonNumber, cover: $cover, coverBig: $coverBig)';
}


}

/// @nodoc
abstract mixin class $XtreamSeasonCopyWith<$Res>  {
  factory $XtreamSeasonCopyWith(XtreamSeason value, $Res Function(XtreamSeason) _then) = _$XtreamSeasonCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'air_date') String? airDate,@JsonKey(name: 'episode_count') int? episodeCount, int? id, String? name, String? overview,@JsonKey(name: 'season_number') int? seasonNumber, String? cover,@JsonKey(name: 'cover_big') String? coverBig
});




}
/// @nodoc
class _$XtreamSeasonCopyWithImpl<$Res>
    implements $XtreamSeasonCopyWith<$Res> {
  _$XtreamSeasonCopyWithImpl(this._self, this._then);

  final XtreamSeason _self;
  final $Res Function(XtreamSeason) _then;

/// Create a copy of XtreamSeason
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? airDate = freezed,Object? episodeCount = freezed,Object? id = freezed,Object? name = freezed,Object? overview = freezed,Object? seasonNumber = freezed,Object? cover = freezed,Object? coverBig = freezed,}) {
  return _then(_self.copyWith(
airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,episodeCount: freezed == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,coverBig: freezed == coverBig ? _self.coverBig : coverBig // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamSeason].
extension XtreamSeasonPatterns on XtreamSeason {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamSeason value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamSeason() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamSeason value)  $default,){
final _that = this;
switch (_that) {
case _XtreamSeason():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamSeason value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamSeason() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'air_date')  String? airDate, @JsonKey(name: 'episode_count')  int? episodeCount,  int? id,  String? name,  String? overview, @JsonKey(name: 'season_number')  int? seasonNumber,  String? cover, @JsonKey(name: 'cover_big')  String? coverBig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamSeason() when $default != null:
return $default(_that.airDate,_that.episodeCount,_that.id,_that.name,_that.overview,_that.seasonNumber,_that.cover,_that.coverBig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'air_date')  String? airDate, @JsonKey(name: 'episode_count')  int? episodeCount,  int? id,  String? name,  String? overview, @JsonKey(name: 'season_number')  int? seasonNumber,  String? cover, @JsonKey(name: 'cover_big')  String? coverBig)  $default,) {final _that = this;
switch (_that) {
case _XtreamSeason():
return $default(_that.airDate,_that.episodeCount,_that.id,_that.name,_that.overview,_that.seasonNumber,_that.cover,_that.coverBig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'air_date')  String? airDate, @JsonKey(name: 'episode_count')  int? episodeCount,  int? id,  String? name,  String? overview, @JsonKey(name: 'season_number')  int? seasonNumber,  String? cover, @JsonKey(name: 'cover_big')  String? coverBig)?  $default,) {final _that = this;
switch (_that) {
case _XtreamSeason() when $default != null:
return $default(_that.airDate,_that.episodeCount,_that.id,_that.name,_that.overview,_that.seasonNumber,_that.cover,_that.coverBig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamSeason implements XtreamSeason {
  const _XtreamSeason({@JsonKey(name: 'air_date') this.airDate, @JsonKey(name: 'episode_count') this.episodeCount, this.id, this.name, this.overview, @JsonKey(name: 'season_number') this.seasonNumber, this.cover, @JsonKey(name: 'cover_big') this.coverBig});
  factory _XtreamSeason.fromJson(Map<String, dynamic> json) => _$XtreamSeasonFromJson(json);

@override@JsonKey(name: 'air_date') final  String? airDate;
@override@JsonKey(name: 'episode_count') final  int? episodeCount;
@override final  int? id;
@override final  String? name;
@override final  String? overview;
@override@JsonKey(name: 'season_number') final  int? seasonNumber;
@override final  String? cover;
@override@JsonKey(name: 'cover_big') final  String? coverBig;

/// Create a copy of XtreamSeason
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamSeasonCopyWith<_XtreamSeason> get copyWith => __$XtreamSeasonCopyWithImpl<_XtreamSeason>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamSeasonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamSeason&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.coverBig, coverBig) || other.coverBig == coverBig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airDate,episodeCount,id,name,overview,seasonNumber,cover,coverBig);

@override
String toString() {
  return 'XtreamSeason(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, seasonNumber: $seasonNumber, cover: $cover, coverBig: $coverBig)';
}


}

/// @nodoc
abstract mixin class _$XtreamSeasonCopyWith<$Res> implements $XtreamSeasonCopyWith<$Res> {
  factory _$XtreamSeasonCopyWith(_XtreamSeason value, $Res Function(_XtreamSeason) _then) = __$XtreamSeasonCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'air_date') String? airDate,@JsonKey(name: 'episode_count') int? episodeCount, int? id, String? name, String? overview,@JsonKey(name: 'season_number') int? seasonNumber, String? cover,@JsonKey(name: 'cover_big') String? coverBig
});




}
/// @nodoc
class __$XtreamSeasonCopyWithImpl<$Res>
    implements _$XtreamSeasonCopyWith<$Res> {
  __$XtreamSeasonCopyWithImpl(this._self, this._then);

  final _XtreamSeason _self;
  final $Res Function(_XtreamSeason) _then;

/// Create a copy of XtreamSeason
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? airDate = freezed,Object? episodeCount = freezed,Object? id = freezed,Object? name = freezed,Object? overview = freezed,Object? seasonNumber = freezed,Object? cover = freezed,Object? coverBig = freezed,}) {
  return _then(_XtreamSeason(
airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,episodeCount: freezed == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,coverBig: freezed == coverBig ? _self.coverBig : coverBig // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$XtreamEpisode {

 String? get id;@JsonKey(name: 'episode_num') int? get episodeNum; String? get title;@JsonKey(name: 'container_extension') String? get containerExtension; XtreamEpisodeInfo? get info;@JsonKey(name: 'custom_sid') String? get customSid; String? get added; int? get season;@JsonKey(name: 'direct_source') String? get directSource;
/// Create a copy of XtreamEpisode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamEpisodeCopyWith<XtreamEpisode> get copyWith => _$XtreamEpisodeCopyWithImpl<XtreamEpisode>(this as XtreamEpisode, _$identity);

  /// Serializes this XtreamEpisode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamEpisode&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeNum, episodeNum) || other.episodeNum == episodeNum)&&(identical(other.title, title) || other.title == title)&&(identical(other.containerExtension, containerExtension) || other.containerExtension == containerExtension)&&(identical(other.info, info) || other.info == info)&&(identical(other.customSid, customSid) || other.customSid == customSid)&&(identical(other.added, added) || other.added == added)&&(identical(other.season, season) || other.season == season)&&(identical(other.directSource, directSource) || other.directSource == directSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,episodeNum,title,containerExtension,info,customSid,added,season,directSource);

@override
String toString() {
  return 'XtreamEpisode(id: $id, episodeNum: $episodeNum, title: $title, containerExtension: $containerExtension, info: $info, customSid: $customSid, added: $added, season: $season, directSource: $directSource)';
}


}

/// @nodoc
abstract mixin class $XtreamEpisodeCopyWith<$Res>  {
  factory $XtreamEpisodeCopyWith(XtreamEpisode value, $Res Function(XtreamEpisode) _then) = _$XtreamEpisodeCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'episode_num') int? episodeNum, String? title,@JsonKey(name: 'container_extension') String? containerExtension, XtreamEpisodeInfo? info,@JsonKey(name: 'custom_sid') String? customSid, String? added, int? season,@JsonKey(name: 'direct_source') String? directSource
});


$XtreamEpisodeInfoCopyWith<$Res>? get info;

}
/// @nodoc
class _$XtreamEpisodeCopyWithImpl<$Res>
    implements $XtreamEpisodeCopyWith<$Res> {
  _$XtreamEpisodeCopyWithImpl(this._self, this._then);

  final XtreamEpisode _self;
  final $Res Function(XtreamEpisode) _then;

/// Create a copy of XtreamEpisode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? episodeNum = freezed,Object? title = freezed,Object? containerExtension = freezed,Object? info = freezed,Object? customSid = freezed,Object? added = freezed,Object? season = freezed,Object? directSource = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,episodeNum: freezed == episodeNum ? _self.episodeNum : episodeNum // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,containerExtension: freezed == containerExtension ? _self.containerExtension : containerExtension // ignore: cast_nullable_to_non_nullable
as String?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as XtreamEpisodeInfo?,customSid: freezed == customSid ? _self.customSid : customSid // ignore: cast_nullable_to_non_nullable
as String?,added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as String?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int?,directSource: freezed == directSource ? _self.directSource : directSource // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of XtreamEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XtreamEpisodeInfoCopyWith<$Res>? get info {
    if (_self.info == null) {
    return null;
  }

  return $XtreamEpisodeInfoCopyWith<$Res>(_self.info!, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [XtreamEpisode].
extension XtreamEpisodePatterns on XtreamEpisode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamEpisode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamEpisode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamEpisode value)  $default,){
final _that = this;
switch (_that) {
case _XtreamEpisode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamEpisode value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamEpisode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'episode_num')  int? episodeNum,  String? title, @JsonKey(name: 'container_extension')  String? containerExtension,  XtreamEpisodeInfo? info, @JsonKey(name: 'custom_sid')  String? customSid,  String? added,  int? season, @JsonKey(name: 'direct_source')  String? directSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamEpisode() when $default != null:
return $default(_that.id,_that.episodeNum,_that.title,_that.containerExtension,_that.info,_that.customSid,_that.added,_that.season,_that.directSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'episode_num')  int? episodeNum,  String? title, @JsonKey(name: 'container_extension')  String? containerExtension,  XtreamEpisodeInfo? info, @JsonKey(name: 'custom_sid')  String? customSid,  String? added,  int? season, @JsonKey(name: 'direct_source')  String? directSource)  $default,) {final _that = this;
switch (_that) {
case _XtreamEpisode():
return $default(_that.id,_that.episodeNum,_that.title,_that.containerExtension,_that.info,_that.customSid,_that.added,_that.season,_that.directSource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'episode_num')  int? episodeNum,  String? title, @JsonKey(name: 'container_extension')  String? containerExtension,  XtreamEpisodeInfo? info, @JsonKey(name: 'custom_sid')  String? customSid,  String? added,  int? season, @JsonKey(name: 'direct_source')  String? directSource)?  $default,) {final _that = this;
switch (_that) {
case _XtreamEpisode() when $default != null:
return $default(_that.id,_that.episodeNum,_that.title,_that.containerExtension,_that.info,_that.customSid,_that.added,_that.season,_that.directSource);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamEpisode implements XtreamEpisode {
  const _XtreamEpisode({this.id, @JsonKey(name: 'episode_num') this.episodeNum, this.title, @JsonKey(name: 'container_extension') this.containerExtension, this.info, @JsonKey(name: 'custom_sid') this.customSid, this.added, this.season, @JsonKey(name: 'direct_source') this.directSource});
  factory _XtreamEpisode.fromJson(Map<String, dynamic> json) => _$XtreamEpisodeFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'episode_num') final  int? episodeNum;
@override final  String? title;
@override@JsonKey(name: 'container_extension') final  String? containerExtension;
@override final  XtreamEpisodeInfo? info;
@override@JsonKey(name: 'custom_sid') final  String? customSid;
@override final  String? added;
@override final  int? season;
@override@JsonKey(name: 'direct_source') final  String? directSource;

/// Create a copy of XtreamEpisode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamEpisodeCopyWith<_XtreamEpisode> get copyWith => __$XtreamEpisodeCopyWithImpl<_XtreamEpisode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamEpisodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamEpisode&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeNum, episodeNum) || other.episodeNum == episodeNum)&&(identical(other.title, title) || other.title == title)&&(identical(other.containerExtension, containerExtension) || other.containerExtension == containerExtension)&&(identical(other.info, info) || other.info == info)&&(identical(other.customSid, customSid) || other.customSid == customSid)&&(identical(other.added, added) || other.added == added)&&(identical(other.season, season) || other.season == season)&&(identical(other.directSource, directSource) || other.directSource == directSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,episodeNum,title,containerExtension,info,customSid,added,season,directSource);

@override
String toString() {
  return 'XtreamEpisode(id: $id, episodeNum: $episodeNum, title: $title, containerExtension: $containerExtension, info: $info, customSid: $customSid, added: $added, season: $season, directSource: $directSource)';
}


}

/// @nodoc
abstract mixin class _$XtreamEpisodeCopyWith<$Res> implements $XtreamEpisodeCopyWith<$Res> {
  factory _$XtreamEpisodeCopyWith(_XtreamEpisode value, $Res Function(_XtreamEpisode) _then) = __$XtreamEpisodeCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'episode_num') int? episodeNum, String? title,@JsonKey(name: 'container_extension') String? containerExtension, XtreamEpisodeInfo? info,@JsonKey(name: 'custom_sid') String? customSid, String? added, int? season,@JsonKey(name: 'direct_source') String? directSource
});


@override $XtreamEpisodeInfoCopyWith<$Res>? get info;

}
/// @nodoc
class __$XtreamEpisodeCopyWithImpl<$Res>
    implements _$XtreamEpisodeCopyWith<$Res> {
  __$XtreamEpisodeCopyWithImpl(this._self, this._then);

  final _XtreamEpisode _self;
  final $Res Function(_XtreamEpisode) _then;

/// Create a copy of XtreamEpisode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? episodeNum = freezed,Object? title = freezed,Object? containerExtension = freezed,Object? info = freezed,Object? customSid = freezed,Object? added = freezed,Object? season = freezed,Object? directSource = freezed,}) {
  return _then(_XtreamEpisode(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,episodeNum: freezed == episodeNum ? _self.episodeNum : episodeNum // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,containerExtension: freezed == containerExtension ? _self.containerExtension : containerExtension // ignore: cast_nullable_to_non_nullable
as String?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as XtreamEpisodeInfo?,customSid: freezed == customSid ? _self.customSid : customSid // ignore: cast_nullable_to_non_nullable
as String?,added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as String?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int?,directSource: freezed == directSource ? _self.directSource : directSource // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of XtreamEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XtreamEpisodeInfoCopyWith<$Res>? get info {
    if (_self.info == null) {
    return null;
  }

  return $XtreamEpisodeInfoCopyWith<$Res>(_self.info!, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// @nodoc
mixin _$XtreamEpisodeInfo {

@JsonKey(name: 'movie_image') String? get movieImage; String? get plot;@JsonKey(name: 'release_date') String? get releaseDate; double? get rating; String? get duration;@JsonKey(name: 'duration_secs') int? get durationSecs; XtreamVideoInfo? get video; XtreamAudioInfo? get audio; int? get bitrate;
/// Create a copy of XtreamEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamEpisodeInfoCopyWith<XtreamEpisodeInfo> get copyWith => _$XtreamEpisodeInfoCopyWithImpl<XtreamEpisodeInfo>(this as XtreamEpisodeInfo, _$identity);

  /// Serializes this XtreamEpisodeInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamEpisodeInfo&&(identical(other.movieImage, movieImage) || other.movieImage == movieImage)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.durationSecs, durationSecs) || other.durationSecs == durationSecs)&&(identical(other.video, video) || other.video == video)&&(identical(other.audio, audio) || other.audio == audio)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,movieImage,plot,releaseDate,rating,duration,durationSecs,video,audio,bitrate);

@override
String toString() {
  return 'XtreamEpisodeInfo(movieImage: $movieImage, plot: $plot, releaseDate: $releaseDate, rating: $rating, duration: $duration, durationSecs: $durationSecs, video: $video, audio: $audio, bitrate: $bitrate)';
}


}

/// @nodoc
abstract mixin class $XtreamEpisodeInfoCopyWith<$Res>  {
  factory $XtreamEpisodeInfoCopyWith(XtreamEpisodeInfo value, $Res Function(XtreamEpisodeInfo) _then) = _$XtreamEpisodeInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'movie_image') String? movieImage, String? plot,@JsonKey(name: 'release_date') String? releaseDate, double? rating, String? duration,@JsonKey(name: 'duration_secs') int? durationSecs, XtreamVideoInfo? video, XtreamAudioInfo? audio, int? bitrate
});


$XtreamVideoInfoCopyWith<$Res>? get video;$XtreamAudioInfoCopyWith<$Res>? get audio;

}
/// @nodoc
class _$XtreamEpisodeInfoCopyWithImpl<$Res>
    implements $XtreamEpisodeInfoCopyWith<$Res> {
  _$XtreamEpisodeInfoCopyWithImpl(this._self, this._then);

  final XtreamEpisodeInfo _self;
  final $Res Function(XtreamEpisodeInfo) _then;

/// Create a copy of XtreamEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movieImage = freezed,Object? plot = freezed,Object? releaseDate = freezed,Object? rating = freezed,Object? duration = freezed,Object? durationSecs = freezed,Object? video = freezed,Object? audio = freezed,Object? bitrate = freezed,}) {
  return _then(_self.copyWith(
movieImage: freezed == movieImage ? _self.movieImage : movieImage // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,durationSecs: freezed == durationSecs ? _self.durationSecs : durationSecs // ignore: cast_nullable_to_non_nullable
as int?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as XtreamVideoInfo?,audio: freezed == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as XtreamAudioInfo?,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of XtreamEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XtreamVideoInfoCopyWith<$Res>? get video {
    if (_self.video == null) {
    return null;
  }

  return $XtreamVideoInfoCopyWith<$Res>(_self.video!, (value) {
    return _then(_self.copyWith(video: value));
  });
}/// Create a copy of XtreamEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XtreamAudioInfoCopyWith<$Res>? get audio {
    if (_self.audio == null) {
    return null;
  }

  return $XtreamAudioInfoCopyWith<$Res>(_self.audio!, (value) {
    return _then(_self.copyWith(audio: value));
  });
}
}


/// Adds pattern-matching-related methods to [XtreamEpisodeInfo].
extension XtreamEpisodeInfoPatterns on XtreamEpisodeInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamEpisodeInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamEpisodeInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamEpisodeInfo value)  $default,){
final _that = this;
switch (_that) {
case _XtreamEpisodeInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamEpisodeInfo value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamEpisodeInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'movie_image')  String? movieImage,  String? plot, @JsonKey(name: 'release_date')  String? releaseDate,  double? rating,  String? duration, @JsonKey(name: 'duration_secs')  int? durationSecs,  XtreamVideoInfo? video,  XtreamAudioInfo? audio,  int? bitrate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamEpisodeInfo() when $default != null:
return $default(_that.movieImage,_that.plot,_that.releaseDate,_that.rating,_that.duration,_that.durationSecs,_that.video,_that.audio,_that.bitrate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'movie_image')  String? movieImage,  String? plot, @JsonKey(name: 'release_date')  String? releaseDate,  double? rating,  String? duration, @JsonKey(name: 'duration_secs')  int? durationSecs,  XtreamVideoInfo? video,  XtreamAudioInfo? audio,  int? bitrate)  $default,) {final _that = this;
switch (_that) {
case _XtreamEpisodeInfo():
return $default(_that.movieImage,_that.plot,_that.releaseDate,_that.rating,_that.duration,_that.durationSecs,_that.video,_that.audio,_that.bitrate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'movie_image')  String? movieImage,  String? plot, @JsonKey(name: 'release_date')  String? releaseDate,  double? rating,  String? duration, @JsonKey(name: 'duration_secs')  int? durationSecs,  XtreamVideoInfo? video,  XtreamAudioInfo? audio,  int? bitrate)?  $default,) {final _that = this;
switch (_that) {
case _XtreamEpisodeInfo() when $default != null:
return $default(_that.movieImage,_that.plot,_that.releaseDate,_that.rating,_that.duration,_that.durationSecs,_that.video,_that.audio,_that.bitrate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamEpisodeInfo implements XtreamEpisodeInfo {
  const _XtreamEpisodeInfo({@JsonKey(name: 'movie_image') this.movieImage, this.plot, @JsonKey(name: 'release_date') this.releaseDate, this.rating, this.duration, @JsonKey(name: 'duration_secs') this.durationSecs, this.video, this.audio, this.bitrate});
  factory _XtreamEpisodeInfo.fromJson(Map<String, dynamic> json) => _$XtreamEpisodeInfoFromJson(json);

@override@JsonKey(name: 'movie_image') final  String? movieImage;
@override final  String? plot;
@override@JsonKey(name: 'release_date') final  String? releaseDate;
@override final  double? rating;
@override final  String? duration;
@override@JsonKey(name: 'duration_secs') final  int? durationSecs;
@override final  XtreamVideoInfo? video;
@override final  XtreamAudioInfo? audio;
@override final  int? bitrate;

/// Create a copy of XtreamEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamEpisodeInfoCopyWith<_XtreamEpisodeInfo> get copyWith => __$XtreamEpisodeInfoCopyWithImpl<_XtreamEpisodeInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamEpisodeInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamEpisodeInfo&&(identical(other.movieImage, movieImage) || other.movieImage == movieImage)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.durationSecs, durationSecs) || other.durationSecs == durationSecs)&&(identical(other.video, video) || other.video == video)&&(identical(other.audio, audio) || other.audio == audio)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,movieImage,plot,releaseDate,rating,duration,durationSecs,video,audio,bitrate);

@override
String toString() {
  return 'XtreamEpisodeInfo(movieImage: $movieImage, plot: $plot, releaseDate: $releaseDate, rating: $rating, duration: $duration, durationSecs: $durationSecs, video: $video, audio: $audio, bitrate: $bitrate)';
}


}

/// @nodoc
abstract mixin class _$XtreamEpisodeInfoCopyWith<$Res> implements $XtreamEpisodeInfoCopyWith<$Res> {
  factory _$XtreamEpisodeInfoCopyWith(_XtreamEpisodeInfo value, $Res Function(_XtreamEpisodeInfo) _then) = __$XtreamEpisodeInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'movie_image') String? movieImage, String? plot,@JsonKey(name: 'release_date') String? releaseDate, double? rating, String? duration,@JsonKey(name: 'duration_secs') int? durationSecs, XtreamVideoInfo? video, XtreamAudioInfo? audio, int? bitrate
});


@override $XtreamVideoInfoCopyWith<$Res>? get video;@override $XtreamAudioInfoCopyWith<$Res>? get audio;

}
/// @nodoc
class __$XtreamEpisodeInfoCopyWithImpl<$Res>
    implements _$XtreamEpisodeInfoCopyWith<$Res> {
  __$XtreamEpisodeInfoCopyWithImpl(this._self, this._then);

  final _XtreamEpisodeInfo _self;
  final $Res Function(_XtreamEpisodeInfo) _then;

/// Create a copy of XtreamEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieImage = freezed,Object? plot = freezed,Object? releaseDate = freezed,Object? rating = freezed,Object? duration = freezed,Object? durationSecs = freezed,Object? video = freezed,Object? audio = freezed,Object? bitrate = freezed,}) {
  return _then(_XtreamEpisodeInfo(
movieImage: freezed == movieImage ? _self.movieImage : movieImage // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,durationSecs: freezed == durationSecs ? _self.durationSecs : durationSecs // ignore: cast_nullable_to_non_nullable
as int?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as XtreamVideoInfo?,audio: freezed == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as XtreamAudioInfo?,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of XtreamEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XtreamVideoInfoCopyWith<$Res>? get video {
    if (_self.video == null) {
    return null;
  }

  return $XtreamVideoInfoCopyWith<$Res>(_self.video!, (value) {
    return _then(_self.copyWith(video: value));
  });
}/// Create a copy of XtreamEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XtreamAudioInfoCopyWith<$Res>? get audio {
    if (_self.audio == null) {
    return null;
  }

  return $XtreamAudioInfoCopyWith<$Res>(_self.audio!, (value) {
    return _then(_self.copyWith(audio: value));
  });
}
}


/// @nodoc
mixin _$XtreamVideoInfo {

 String? get codec; String? get width; String? get height;
/// Create a copy of XtreamVideoInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamVideoInfoCopyWith<XtreamVideoInfo> get copyWith => _$XtreamVideoInfoCopyWithImpl<XtreamVideoInfo>(this as XtreamVideoInfo, _$identity);

  /// Serializes this XtreamVideoInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamVideoInfo&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,codec,width,height);

@override
String toString() {
  return 'XtreamVideoInfo(codec: $codec, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $XtreamVideoInfoCopyWith<$Res>  {
  factory $XtreamVideoInfoCopyWith(XtreamVideoInfo value, $Res Function(XtreamVideoInfo) _then) = _$XtreamVideoInfoCopyWithImpl;
@useResult
$Res call({
 String? codec, String? width, String? height
});




}
/// @nodoc
class _$XtreamVideoInfoCopyWithImpl<$Res>
    implements $XtreamVideoInfoCopyWith<$Res> {
  _$XtreamVideoInfoCopyWithImpl(this._self, this._then);

  final XtreamVideoInfo _self;
  final $Res Function(XtreamVideoInfo) _then;

/// Create a copy of XtreamVideoInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codec = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamVideoInfo].
extension XtreamVideoInfoPatterns on XtreamVideoInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamVideoInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamVideoInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamVideoInfo value)  $default,){
final _that = this;
switch (_that) {
case _XtreamVideoInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamVideoInfo value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamVideoInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? codec,  String? width,  String? height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamVideoInfo() when $default != null:
return $default(_that.codec,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? codec,  String? width,  String? height)  $default,) {final _that = this;
switch (_that) {
case _XtreamVideoInfo():
return $default(_that.codec,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? codec,  String? width,  String? height)?  $default,) {final _that = this;
switch (_that) {
case _XtreamVideoInfo() when $default != null:
return $default(_that.codec,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamVideoInfo implements XtreamVideoInfo {
  const _XtreamVideoInfo({this.codec, this.width, this.height});
  factory _XtreamVideoInfo.fromJson(Map<String, dynamic> json) => _$XtreamVideoInfoFromJson(json);

@override final  String? codec;
@override final  String? width;
@override final  String? height;

/// Create a copy of XtreamVideoInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamVideoInfoCopyWith<_XtreamVideoInfo> get copyWith => __$XtreamVideoInfoCopyWithImpl<_XtreamVideoInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamVideoInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamVideoInfo&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,codec,width,height);

@override
String toString() {
  return 'XtreamVideoInfo(codec: $codec, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$XtreamVideoInfoCopyWith<$Res> implements $XtreamVideoInfoCopyWith<$Res> {
  factory _$XtreamVideoInfoCopyWith(_XtreamVideoInfo value, $Res Function(_XtreamVideoInfo) _then) = __$XtreamVideoInfoCopyWithImpl;
@override @useResult
$Res call({
 String? codec, String? width, String? height
});




}
/// @nodoc
class __$XtreamVideoInfoCopyWithImpl<$Res>
    implements _$XtreamVideoInfoCopyWith<$Res> {
  __$XtreamVideoInfoCopyWithImpl(this._self, this._then);

  final _XtreamVideoInfo _self;
  final $Res Function(_XtreamVideoInfo) _then;

/// Create a copy of XtreamVideoInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codec = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(_XtreamVideoInfo(
codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$XtreamAudioInfo {

 String? get codec; String? get channels;@JsonKey(name: 'sample_rate') String? get sampleRate;
/// Create a copy of XtreamAudioInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamAudioInfoCopyWith<XtreamAudioInfo> get copyWith => _$XtreamAudioInfoCopyWithImpl<XtreamAudioInfo>(this as XtreamAudioInfo, _$identity);

  /// Serializes this XtreamAudioInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamAudioInfo&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,codec,channels,sampleRate);

@override
String toString() {
  return 'XtreamAudioInfo(codec: $codec, channels: $channels, sampleRate: $sampleRate)';
}


}

/// @nodoc
abstract mixin class $XtreamAudioInfoCopyWith<$Res>  {
  factory $XtreamAudioInfoCopyWith(XtreamAudioInfo value, $Res Function(XtreamAudioInfo) _then) = _$XtreamAudioInfoCopyWithImpl;
@useResult
$Res call({
 String? codec, String? channels,@JsonKey(name: 'sample_rate') String? sampleRate
});




}
/// @nodoc
class _$XtreamAudioInfoCopyWithImpl<$Res>
    implements $XtreamAudioInfoCopyWith<$Res> {
  _$XtreamAudioInfoCopyWithImpl(this._self, this._then);

  final XtreamAudioInfo _self;
  final $Res Function(XtreamAudioInfo) _then;

/// Create a copy of XtreamAudioInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codec = freezed,Object? channels = freezed,Object? sampleRate = freezed,}) {
  return _then(_self.copyWith(
codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,channels: freezed == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as String?,sampleRate: freezed == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamAudioInfo].
extension XtreamAudioInfoPatterns on XtreamAudioInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamAudioInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamAudioInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamAudioInfo value)  $default,){
final _that = this;
switch (_that) {
case _XtreamAudioInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamAudioInfo value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamAudioInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? codec,  String? channels, @JsonKey(name: 'sample_rate')  String? sampleRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamAudioInfo() when $default != null:
return $default(_that.codec,_that.channels,_that.sampleRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? codec,  String? channels, @JsonKey(name: 'sample_rate')  String? sampleRate)  $default,) {final _that = this;
switch (_that) {
case _XtreamAudioInfo():
return $default(_that.codec,_that.channels,_that.sampleRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? codec,  String? channels, @JsonKey(name: 'sample_rate')  String? sampleRate)?  $default,) {final _that = this;
switch (_that) {
case _XtreamAudioInfo() when $default != null:
return $default(_that.codec,_that.channels,_that.sampleRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamAudioInfo implements XtreamAudioInfo {
  const _XtreamAudioInfo({this.codec, this.channels, @JsonKey(name: 'sample_rate') this.sampleRate});
  factory _XtreamAudioInfo.fromJson(Map<String, dynamic> json) => _$XtreamAudioInfoFromJson(json);

@override final  String? codec;
@override final  String? channels;
@override@JsonKey(name: 'sample_rate') final  String? sampleRate;

/// Create a copy of XtreamAudioInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamAudioInfoCopyWith<_XtreamAudioInfo> get copyWith => __$XtreamAudioInfoCopyWithImpl<_XtreamAudioInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamAudioInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamAudioInfo&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,codec,channels,sampleRate);

@override
String toString() {
  return 'XtreamAudioInfo(codec: $codec, channels: $channels, sampleRate: $sampleRate)';
}


}

/// @nodoc
abstract mixin class _$XtreamAudioInfoCopyWith<$Res> implements $XtreamAudioInfoCopyWith<$Res> {
  factory _$XtreamAudioInfoCopyWith(_XtreamAudioInfo value, $Res Function(_XtreamAudioInfo) _then) = __$XtreamAudioInfoCopyWithImpl;
@override @useResult
$Res call({
 String? codec, String? channels,@JsonKey(name: 'sample_rate') String? sampleRate
});




}
/// @nodoc
class __$XtreamAudioInfoCopyWithImpl<$Res>
    implements _$XtreamAudioInfoCopyWith<$Res> {
  __$XtreamAudioInfoCopyWithImpl(this._self, this._then);

  final _XtreamAudioInfo _self;
  final $Res Function(_XtreamAudioInfo) _then;

/// Create a copy of XtreamAudioInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codec = freezed,Object? channels = freezed,Object? sampleRate = freezed,}) {
  return _then(_XtreamAudioInfo(
codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,channels: freezed == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as String?,sampleRate: freezed == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
