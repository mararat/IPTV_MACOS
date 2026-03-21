// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlaySession {

 String get playUrl; Map<String, String> get headers;
/// Create a copy of PlaySession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaySessionCopyWith<PlaySession> get copyWith => _$PlaySessionCopyWithImpl<PlaySession>(this as PlaySession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaySession&&(identical(other.playUrl, playUrl) || other.playUrl == playUrl)&&const DeepCollectionEquality().equals(other.headers, headers));
}


@override
int get hashCode => Object.hash(runtimeType,playUrl,const DeepCollectionEquality().hash(headers));

@override
String toString() {
  return 'PlaySession(playUrl: $playUrl, headers: $headers)';
}


}

/// @nodoc
abstract mixin class $PlaySessionCopyWith<$Res>  {
  factory $PlaySessionCopyWith(PlaySession value, $Res Function(PlaySession) _then) = _$PlaySessionCopyWithImpl;
@useResult
$Res call({
 String playUrl, Map<String, String> headers
});




}
/// @nodoc
class _$PlaySessionCopyWithImpl<$Res>
    implements $PlaySessionCopyWith<$Res> {
  _$PlaySessionCopyWithImpl(this._self, this._then);

  final PlaySession _self;
  final $Res Function(PlaySession) _then;

/// Create a copy of PlaySession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playUrl = null,Object? headers = null,}) {
  return _then(_self.copyWith(
playUrl: null == playUrl ? _self.playUrl : playUrl // ignore: cast_nullable_to_non_nullable
as String,headers: null == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaySession].
extension PlaySessionPatterns on PlaySession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaySession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaySession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaySession value)  $default,){
final _that = this;
switch (_that) {
case _PlaySession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaySession value)?  $default,){
final _that = this;
switch (_that) {
case _PlaySession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String playUrl,  Map<String, String> headers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaySession() when $default != null:
return $default(_that.playUrl,_that.headers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String playUrl,  Map<String, String> headers)  $default,) {final _that = this;
switch (_that) {
case _PlaySession():
return $default(_that.playUrl,_that.headers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String playUrl,  Map<String, String> headers)?  $default,) {final _that = this;
switch (_that) {
case _PlaySession() when $default != null:
return $default(_that.playUrl,_that.headers);case _:
  return null;

}
}

}

/// @nodoc


class _PlaySession implements PlaySession {
  const _PlaySession({required this.playUrl, final  Map<String, String> headers = const {}}): _headers = headers;
  

@override final  String playUrl;
 final  Map<String, String> _headers;
@override@JsonKey() Map<String, String> get headers {
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_headers);
}


/// Create a copy of PlaySession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaySessionCopyWith<_PlaySession> get copyWith => __$PlaySessionCopyWithImpl<_PlaySession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaySession&&(identical(other.playUrl, playUrl) || other.playUrl == playUrl)&&const DeepCollectionEquality().equals(other._headers, _headers));
}


@override
int get hashCode => Object.hash(runtimeType,playUrl,const DeepCollectionEquality().hash(_headers));

@override
String toString() {
  return 'PlaySession(playUrl: $playUrl, headers: $headers)';
}


}

/// @nodoc
abstract mixin class _$PlaySessionCopyWith<$Res> implements $PlaySessionCopyWith<$Res> {
  factory _$PlaySessionCopyWith(_PlaySession value, $Res Function(_PlaySession) _then) = __$PlaySessionCopyWithImpl;
@override @useResult
$Res call({
 String playUrl, Map<String, String> headers
});




}
/// @nodoc
class __$PlaySessionCopyWithImpl<$Res>
    implements _$PlaySessionCopyWith<$Res> {
  __$PlaySessionCopyWithImpl(this._self, this._then);

  final _PlaySession _self;
  final $Res Function(_PlaySession) _then;

/// Create a copy of PlaySession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playUrl = null,Object? headers = null,}) {
  return _then(_PlaySession(
playUrl: null == playUrl ? _self.playUrl : playUrl // ignore: cast_nullable_to_non_nullable
as String,headers: null == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
