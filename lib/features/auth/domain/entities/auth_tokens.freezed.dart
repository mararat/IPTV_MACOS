// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$XtreamCredentials {

 String get serverUrl; String get username; String get password;
/// Create a copy of XtreamCredentials
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamCredentialsCopyWith<XtreamCredentials> get copyWith => _$XtreamCredentialsCopyWithImpl<XtreamCredentials>(this as XtreamCredentials, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamCredentials&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,username,password);

@override
String toString() {
  return 'XtreamCredentials(serverUrl: $serverUrl, username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $XtreamCredentialsCopyWith<$Res>  {
  factory $XtreamCredentialsCopyWith(XtreamCredentials value, $Res Function(XtreamCredentials) _then) = _$XtreamCredentialsCopyWithImpl;
@useResult
$Res call({
 String serverUrl, String username, String password
});




}
/// @nodoc
class _$XtreamCredentialsCopyWithImpl<$Res>
    implements $XtreamCredentialsCopyWith<$Res> {
  _$XtreamCredentialsCopyWithImpl(this._self, this._then);

  final XtreamCredentials _self;
  final $Res Function(XtreamCredentials) _then;

/// Create a copy of XtreamCredentials
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverUrl = null,Object? username = null,Object? password = null,}) {
  return _then(_self.copyWith(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamCredentials].
extension XtreamCredentialsPatterns on XtreamCredentials {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamCredentials value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamCredentials() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamCredentials value)  $default,){
final _that = this;
switch (_that) {
case _XtreamCredentials():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamCredentials value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamCredentials() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverUrl,  String username,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamCredentials() when $default != null:
return $default(_that.serverUrl,_that.username,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverUrl,  String username,  String password)  $default,) {final _that = this;
switch (_that) {
case _XtreamCredentials():
return $default(_that.serverUrl,_that.username,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverUrl,  String username,  String password)?  $default,) {final _that = this;
switch (_that) {
case _XtreamCredentials() when $default != null:
return $default(_that.serverUrl,_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _XtreamCredentials implements XtreamCredentials {
  const _XtreamCredentials({required this.serverUrl, required this.username, required this.password});
  

@override final  String serverUrl;
@override final  String username;
@override final  String password;

/// Create a copy of XtreamCredentials
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamCredentialsCopyWith<_XtreamCredentials> get copyWith => __$XtreamCredentialsCopyWithImpl<_XtreamCredentials>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamCredentials&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,username,password);

@override
String toString() {
  return 'XtreamCredentials(serverUrl: $serverUrl, username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$XtreamCredentialsCopyWith<$Res> implements $XtreamCredentialsCopyWith<$Res> {
  factory _$XtreamCredentialsCopyWith(_XtreamCredentials value, $Res Function(_XtreamCredentials) _then) = __$XtreamCredentialsCopyWithImpl;
@override @useResult
$Res call({
 String serverUrl, String username, String password
});




}
/// @nodoc
class __$XtreamCredentialsCopyWithImpl<$Res>
    implements _$XtreamCredentialsCopyWith<$Res> {
  __$XtreamCredentialsCopyWithImpl(this._self, this._then);

  final _XtreamCredentials _self;
  final $Res Function(_XtreamCredentials) _then;

/// Create a copy of XtreamCredentials
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverUrl = null,Object? username = null,Object? password = null,}) {
  return _then(_XtreamCredentials(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
