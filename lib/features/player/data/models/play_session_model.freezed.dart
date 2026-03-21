// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaySessionModel {

 String get playUrl; String get playToken; String get expiresAt; Map<String, String> get headers;
/// Create a copy of PlaySessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaySessionModelCopyWith<PlaySessionModel> get copyWith => _$PlaySessionModelCopyWithImpl<PlaySessionModel>(this as PlaySessionModel, _$identity);

  /// Serializes this PlaySessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaySessionModel&&(identical(other.playUrl, playUrl) || other.playUrl == playUrl)&&(identical(other.playToken, playToken) || other.playToken == playToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&const DeepCollectionEquality().equals(other.headers, headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playUrl,playToken,expiresAt,const DeepCollectionEquality().hash(headers));

@override
String toString() {
  return 'PlaySessionModel(playUrl: $playUrl, playToken: $playToken, expiresAt: $expiresAt, headers: $headers)';
}


}

/// @nodoc
abstract mixin class $PlaySessionModelCopyWith<$Res>  {
  factory $PlaySessionModelCopyWith(PlaySessionModel value, $Res Function(PlaySessionModel) _then) = _$PlaySessionModelCopyWithImpl;
@useResult
$Res call({
 String playUrl, String playToken, String expiresAt, Map<String, String> headers
});




}
/// @nodoc
class _$PlaySessionModelCopyWithImpl<$Res>
    implements $PlaySessionModelCopyWith<$Res> {
  _$PlaySessionModelCopyWithImpl(this._self, this._then);

  final PlaySessionModel _self;
  final $Res Function(PlaySessionModel) _then;

/// Create a copy of PlaySessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playUrl = null,Object? playToken = null,Object? expiresAt = null,Object? headers = null,}) {
  return _then(_self.copyWith(
playUrl: null == playUrl ? _self.playUrl : playUrl // ignore: cast_nullable_to_non_nullable
as String,playToken: null == playToken ? _self.playToken : playToken // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,headers: null == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaySessionModel].
extension PlaySessionModelPatterns on PlaySessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaySessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaySessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaySessionModel value)  $default,){
final _that = this;
switch (_that) {
case _PlaySessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaySessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlaySessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String playUrl,  String playToken,  String expiresAt,  Map<String, String> headers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaySessionModel() when $default != null:
return $default(_that.playUrl,_that.playToken,_that.expiresAt,_that.headers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String playUrl,  String playToken,  String expiresAt,  Map<String, String> headers)  $default,) {final _that = this;
switch (_that) {
case _PlaySessionModel():
return $default(_that.playUrl,_that.playToken,_that.expiresAt,_that.headers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String playUrl,  String playToken,  String expiresAt,  Map<String, String> headers)?  $default,) {final _that = this;
switch (_that) {
case _PlaySessionModel() when $default != null:
return $default(_that.playUrl,_that.playToken,_that.expiresAt,_that.headers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaySessionModel implements PlaySessionModel {
  const _PlaySessionModel({required this.playUrl, required this.playToken, required this.expiresAt, final  Map<String, String> headers = const {}}): _headers = headers;
  factory _PlaySessionModel.fromJson(Map<String, dynamic> json) => _$PlaySessionModelFromJson(json);

@override final  String playUrl;
@override final  String playToken;
@override final  String expiresAt;
 final  Map<String, String> _headers;
@override@JsonKey() Map<String, String> get headers {
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_headers);
}


/// Create a copy of PlaySessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaySessionModelCopyWith<_PlaySessionModel> get copyWith => __$PlaySessionModelCopyWithImpl<_PlaySessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaySessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaySessionModel&&(identical(other.playUrl, playUrl) || other.playUrl == playUrl)&&(identical(other.playToken, playToken) || other.playToken == playToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&const DeepCollectionEquality().equals(other._headers, _headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playUrl,playToken,expiresAt,const DeepCollectionEquality().hash(_headers));

@override
String toString() {
  return 'PlaySessionModel(playUrl: $playUrl, playToken: $playToken, expiresAt: $expiresAt, headers: $headers)';
}


}

/// @nodoc
abstract mixin class _$PlaySessionModelCopyWith<$Res> implements $PlaySessionModelCopyWith<$Res> {
  factory _$PlaySessionModelCopyWith(_PlaySessionModel value, $Res Function(_PlaySessionModel) _then) = __$PlaySessionModelCopyWithImpl;
@override @useResult
$Res call({
 String playUrl, String playToken, String expiresAt, Map<String, String> headers
});




}
/// @nodoc
class __$PlaySessionModelCopyWithImpl<$Res>
    implements _$PlaySessionModelCopyWith<$Res> {
  __$PlaySessionModelCopyWithImpl(this._self, this._then);

  final _PlaySessionModel _self;
  final $Res Function(_PlaySessionModel) _then;

/// Create a copy of PlaySessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playUrl = null,Object? playToken = null,Object? expiresAt = null,Object? headers = null,}) {
  return _then(_PlaySessionModel(
playUrl: null == playUrl ? _self.playUrl : playUrl // ignore: cast_nullable_to_non_nullable
as String,playToken: null == playToken ? _self.playToken : playToken // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,headers: null == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
