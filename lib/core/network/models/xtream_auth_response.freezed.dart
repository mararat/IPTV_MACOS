// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xtream_auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XtreamAuthResponse {

@JsonKey(name: 'user_info') XtreamUserInfo get userInfo;@JsonKey(name: 'server_info') XtreamServerInfo get serverInfo;
/// Create a copy of XtreamAuthResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamAuthResponseCopyWith<XtreamAuthResponse> get copyWith => _$XtreamAuthResponseCopyWithImpl<XtreamAuthResponse>(this as XtreamAuthResponse, _$identity);

  /// Serializes this XtreamAuthResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamAuthResponse&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo)&&(identical(other.serverInfo, serverInfo) || other.serverInfo == serverInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userInfo,serverInfo);

@override
String toString() {
  return 'XtreamAuthResponse(userInfo: $userInfo, serverInfo: $serverInfo)';
}


}

/// @nodoc
abstract mixin class $XtreamAuthResponseCopyWith<$Res>  {
  factory $XtreamAuthResponseCopyWith(XtreamAuthResponse value, $Res Function(XtreamAuthResponse) _then) = _$XtreamAuthResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_info') XtreamUserInfo userInfo,@JsonKey(name: 'server_info') XtreamServerInfo serverInfo
});


$XtreamUserInfoCopyWith<$Res> get userInfo;$XtreamServerInfoCopyWith<$Res> get serverInfo;

}
/// @nodoc
class _$XtreamAuthResponseCopyWithImpl<$Res>
    implements $XtreamAuthResponseCopyWith<$Res> {
  _$XtreamAuthResponseCopyWithImpl(this._self, this._then);

  final XtreamAuthResponse _self;
  final $Res Function(XtreamAuthResponse) _then;

/// Create a copy of XtreamAuthResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userInfo = null,Object? serverInfo = null,}) {
  return _then(_self.copyWith(
userInfo: null == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as XtreamUserInfo,serverInfo: null == serverInfo ? _self.serverInfo : serverInfo // ignore: cast_nullable_to_non_nullable
as XtreamServerInfo,
  ));
}
/// Create a copy of XtreamAuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XtreamUserInfoCopyWith<$Res> get userInfo {
  
  return $XtreamUserInfoCopyWith<$Res>(_self.userInfo, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}/// Create a copy of XtreamAuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XtreamServerInfoCopyWith<$Res> get serverInfo {
  
  return $XtreamServerInfoCopyWith<$Res>(_self.serverInfo, (value) {
    return _then(_self.copyWith(serverInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [XtreamAuthResponse].
extension XtreamAuthResponsePatterns on XtreamAuthResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamAuthResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamAuthResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamAuthResponse value)  $default,){
final _that = this;
switch (_that) {
case _XtreamAuthResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamAuthResponse value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamAuthResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_info')  XtreamUserInfo userInfo, @JsonKey(name: 'server_info')  XtreamServerInfo serverInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamAuthResponse() when $default != null:
return $default(_that.userInfo,_that.serverInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_info')  XtreamUserInfo userInfo, @JsonKey(name: 'server_info')  XtreamServerInfo serverInfo)  $default,) {final _that = this;
switch (_that) {
case _XtreamAuthResponse():
return $default(_that.userInfo,_that.serverInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_info')  XtreamUserInfo userInfo, @JsonKey(name: 'server_info')  XtreamServerInfo serverInfo)?  $default,) {final _that = this;
switch (_that) {
case _XtreamAuthResponse() when $default != null:
return $default(_that.userInfo,_that.serverInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamAuthResponse implements XtreamAuthResponse {
  const _XtreamAuthResponse({@JsonKey(name: 'user_info') required this.userInfo, @JsonKey(name: 'server_info') required this.serverInfo});
  factory _XtreamAuthResponse.fromJson(Map<String, dynamic> json) => _$XtreamAuthResponseFromJson(json);

@override@JsonKey(name: 'user_info') final  XtreamUserInfo userInfo;
@override@JsonKey(name: 'server_info') final  XtreamServerInfo serverInfo;

/// Create a copy of XtreamAuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamAuthResponseCopyWith<_XtreamAuthResponse> get copyWith => __$XtreamAuthResponseCopyWithImpl<_XtreamAuthResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamAuthResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamAuthResponse&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo)&&(identical(other.serverInfo, serverInfo) || other.serverInfo == serverInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userInfo,serverInfo);

@override
String toString() {
  return 'XtreamAuthResponse(userInfo: $userInfo, serverInfo: $serverInfo)';
}


}

/// @nodoc
abstract mixin class _$XtreamAuthResponseCopyWith<$Res> implements $XtreamAuthResponseCopyWith<$Res> {
  factory _$XtreamAuthResponseCopyWith(_XtreamAuthResponse value, $Res Function(_XtreamAuthResponse) _then) = __$XtreamAuthResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_info') XtreamUserInfo userInfo,@JsonKey(name: 'server_info') XtreamServerInfo serverInfo
});


@override $XtreamUserInfoCopyWith<$Res> get userInfo;@override $XtreamServerInfoCopyWith<$Res> get serverInfo;

}
/// @nodoc
class __$XtreamAuthResponseCopyWithImpl<$Res>
    implements _$XtreamAuthResponseCopyWith<$Res> {
  __$XtreamAuthResponseCopyWithImpl(this._self, this._then);

  final _XtreamAuthResponse _self;
  final $Res Function(_XtreamAuthResponse) _then;

/// Create a copy of XtreamAuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userInfo = null,Object? serverInfo = null,}) {
  return _then(_XtreamAuthResponse(
userInfo: null == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as XtreamUserInfo,serverInfo: null == serverInfo ? _self.serverInfo : serverInfo // ignore: cast_nullable_to_non_nullable
as XtreamServerInfo,
  ));
}

/// Create a copy of XtreamAuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XtreamUserInfoCopyWith<$Res> get userInfo {
  
  return $XtreamUserInfoCopyWith<$Res>(_self.userInfo, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}/// Create a copy of XtreamAuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XtreamServerInfoCopyWith<$Res> get serverInfo {
  
  return $XtreamServerInfoCopyWith<$Res>(_self.serverInfo, (value) {
    return _then(_self.copyWith(serverInfo: value));
  });
}
}


/// @nodoc
mixin _$XtreamUserInfo {

 String get username; String get password; String? get message; int? get auth; String? get status;@JsonKey(name: 'exp_date') String? get expDate;@JsonKey(name: 'is_trial') String? get isTrial;@JsonKey(name: 'active_cons') String? get activeCons;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'max_connections') String? get maxConnections;@JsonKey(name: 'allowed_output_formats') List<String>? get allowedOutputFormats;
/// Create a copy of XtreamUserInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamUserInfoCopyWith<XtreamUserInfo> get copyWith => _$XtreamUserInfoCopyWithImpl<XtreamUserInfo>(this as XtreamUserInfo, _$identity);

  /// Serializes this XtreamUserInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamUserInfo&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.message, message) || other.message == message)&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.status, status) || other.status == status)&&(identical(other.expDate, expDate) || other.expDate == expDate)&&(identical(other.isTrial, isTrial) || other.isTrial == isTrial)&&(identical(other.activeCons, activeCons) || other.activeCons == activeCons)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.maxConnections, maxConnections) || other.maxConnections == maxConnections)&&const DeepCollectionEquality().equals(other.allowedOutputFormats, allowedOutputFormats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password,message,auth,status,expDate,isTrial,activeCons,createdAt,maxConnections,const DeepCollectionEquality().hash(allowedOutputFormats));

@override
String toString() {
  return 'XtreamUserInfo(username: $username, password: $password, message: $message, auth: $auth, status: $status, expDate: $expDate, isTrial: $isTrial, activeCons: $activeCons, createdAt: $createdAt, maxConnections: $maxConnections, allowedOutputFormats: $allowedOutputFormats)';
}


}

/// @nodoc
abstract mixin class $XtreamUserInfoCopyWith<$Res>  {
  factory $XtreamUserInfoCopyWith(XtreamUserInfo value, $Res Function(XtreamUserInfo) _then) = _$XtreamUserInfoCopyWithImpl;
@useResult
$Res call({
 String username, String password, String? message, int? auth, String? status,@JsonKey(name: 'exp_date') String? expDate,@JsonKey(name: 'is_trial') String? isTrial,@JsonKey(name: 'active_cons') String? activeCons,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'max_connections') String? maxConnections,@JsonKey(name: 'allowed_output_formats') List<String>? allowedOutputFormats
});




}
/// @nodoc
class _$XtreamUserInfoCopyWithImpl<$Res>
    implements $XtreamUserInfoCopyWith<$Res> {
  _$XtreamUserInfoCopyWithImpl(this._self, this._then);

  final XtreamUserInfo _self;
  final $Res Function(XtreamUserInfo) _then;

/// Create a copy of XtreamUserInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,Object? message = freezed,Object? auth = freezed,Object? status = freezed,Object? expDate = freezed,Object? isTrial = freezed,Object? activeCons = freezed,Object? createdAt = freezed,Object? maxConnections = freezed,Object? allowedOutputFormats = freezed,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,auth: freezed == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,expDate: freezed == expDate ? _self.expDate : expDate // ignore: cast_nullable_to_non_nullable
as String?,isTrial: freezed == isTrial ? _self.isTrial : isTrial // ignore: cast_nullable_to_non_nullable
as String?,activeCons: freezed == activeCons ? _self.activeCons : activeCons // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,maxConnections: freezed == maxConnections ? _self.maxConnections : maxConnections // ignore: cast_nullable_to_non_nullable
as String?,allowedOutputFormats: freezed == allowedOutputFormats ? _self.allowedOutputFormats : allowedOutputFormats // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamUserInfo].
extension XtreamUserInfoPatterns on XtreamUserInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamUserInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamUserInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamUserInfo value)  $default,){
final _that = this;
switch (_that) {
case _XtreamUserInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamUserInfo value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamUserInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password,  String? message,  int? auth,  String? status, @JsonKey(name: 'exp_date')  String? expDate, @JsonKey(name: 'is_trial')  String? isTrial, @JsonKey(name: 'active_cons')  String? activeCons, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'max_connections')  String? maxConnections, @JsonKey(name: 'allowed_output_formats')  List<String>? allowedOutputFormats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamUserInfo() when $default != null:
return $default(_that.username,_that.password,_that.message,_that.auth,_that.status,_that.expDate,_that.isTrial,_that.activeCons,_that.createdAt,_that.maxConnections,_that.allowedOutputFormats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password,  String? message,  int? auth,  String? status, @JsonKey(name: 'exp_date')  String? expDate, @JsonKey(name: 'is_trial')  String? isTrial, @JsonKey(name: 'active_cons')  String? activeCons, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'max_connections')  String? maxConnections, @JsonKey(name: 'allowed_output_formats')  List<String>? allowedOutputFormats)  $default,) {final _that = this;
switch (_that) {
case _XtreamUserInfo():
return $default(_that.username,_that.password,_that.message,_that.auth,_that.status,_that.expDate,_that.isTrial,_that.activeCons,_that.createdAt,_that.maxConnections,_that.allowedOutputFormats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password,  String? message,  int? auth,  String? status, @JsonKey(name: 'exp_date')  String? expDate, @JsonKey(name: 'is_trial')  String? isTrial, @JsonKey(name: 'active_cons')  String? activeCons, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'max_connections')  String? maxConnections, @JsonKey(name: 'allowed_output_formats')  List<String>? allowedOutputFormats)?  $default,) {final _that = this;
switch (_that) {
case _XtreamUserInfo() when $default != null:
return $default(_that.username,_that.password,_that.message,_that.auth,_that.status,_that.expDate,_that.isTrial,_that.activeCons,_that.createdAt,_that.maxConnections,_that.allowedOutputFormats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamUserInfo implements XtreamUserInfo {
  const _XtreamUserInfo({required this.username, required this.password, this.message, this.auth, this.status, @JsonKey(name: 'exp_date') this.expDate, @JsonKey(name: 'is_trial') this.isTrial, @JsonKey(name: 'active_cons') this.activeCons, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'max_connections') this.maxConnections, @JsonKey(name: 'allowed_output_formats') final  List<String>? allowedOutputFormats}): _allowedOutputFormats = allowedOutputFormats;
  factory _XtreamUserInfo.fromJson(Map<String, dynamic> json) => _$XtreamUserInfoFromJson(json);

@override final  String username;
@override final  String password;
@override final  String? message;
@override final  int? auth;
@override final  String? status;
@override@JsonKey(name: 'exp_date') final  String? expDate;
@override@JsonKey(name: 'is_trial') final  String? isTrial;
@override@JsonKey(name: 'active_cons') final  String? activeCons;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'max_connections') final  String? maxConnections;
 final  List<String>? _allowedOutputFormats;
@override@JsonKey(name: 'allowed_output_formats') List<String>? get allowedOutputFormats {
  final value = _allowedOutputFormats;
  if (value == null) return null;
  if (_allowedOutputFormats is EqualUnmodifiableListView) return _allowedOutputFormats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of XtreamUserInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamUserInfoCopyWith<_XtreamUserInfo> get copyWith => __$XtreamUserInfoCopyWithImpl<_XtreamUserInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamUserInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamUserInfo&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.message, message) || other.message == message)&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.status, status) || other.status == status)&&(identical(other.expDate, expDate) || other.expDate == expDate)&&(identical(other.isTrial, isTrial) || other.isTrial == isTrial)&&(identical(other.activeCons, activeCons) || other.activeCons == activeCons)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.maxConnections, maxConnections) || other.maxConnections == maxConnections)&&const DeepCollectionEquality().equals(other._allowedOutputFormats, _allowedOutputFormats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password,message,auth,status,expDate,isTrial,activeCons,createdAt,maxConnections,const DeepCollectionEquality().hash(_allowedOutputFormats));

@override
String toString() {
  return 'XtreamUserInfo(username: $username, password: $password, message: $message, auth: $auth, status: $status, expDate: $expDate, isTrial: $isTrial, activeCons: $activeCons, createdAt: $createdAt, maxConnections: $maxConnections, allowedOutputFormats: $allowedOutputFormats)';
}


}

/// @nodoc
abstract mixin class _$XtreamUserInfoCopyWith<$Res> implements $XtreamUserInfoCopyWith<$Res> {
  factory _$XtreamUserInfoCopyWith(_XtreamUserInfo value, $Res Function(_XtreamUserInfo) _then) = __$XtreamUserInfoCopyWithImpl;
@override @useResult
$Res call({
 String username, String password, String? message, int? auth, String? status,@JsonKey(name: 'exp_date') String? expDate,@JsonKey(name: 'is_trial') String? isTrial,@JsonKey(name: 'active_cons') String? activeCons,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'max_connections') String? maxConnections,@JsonKey(name: 'allowed_output_formats') List<String>? allowedOutputFormats
});




}
/// @nodoc
class __$XtreamUserInfoCopyWithImpl<$Res>
    implements _$XtreamUserInfoCopyWith<$Res> {
  __$XtreamUserInfoCopyWithImpl(this._self, this._then);

  final _XtreamUserInfo _self;
  final $Res Function(_XtreamUserInfo) _then;

/// Create a copy of XtreamUserInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,Object? message = freezed,Object? auth = freezed,Object? status = freezed,Object? expDate = freezed,Object? isTrial = freezed,Object? activeCons = freezed,Object? createdAt = freezed,Object? maxConnections = freezed,Object? allowedOutputFormats = freezed,}) {
  return _then(_XtreamUserInfo(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,auth: freezed == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,expDate: freezed == expDate ? _self.expDate : expDate // ignore: cast_nullable_to_non_nullable
as String?,isTrial: freezed == isTrial ? _self.isTrial : isTrial // ignore: cast_nullable_to_non_nullable
as String?,activeCons: freezed == activeCons ? _self.activeCons : activeCons // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,maxConnections: freezed == maxConnections ? _self.maxConnections : maxConnections // ignore: cast_nullable_to_non_nullable
as String?,allowedOutputFormats: freezed == allowedOutputFormats ? _self._allowedOutputFormats : allowedOutputFormats // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$XtreamServerInfo {

 String? get url; String? get port;@JsonKey(name: 'https_port') String? get httpsPort;@JsonKey(name: 'server_protocol') String? get serverProtocol;@JsonKey(name: 'rtmp_port') String? get rtmpPort; String? get timezone;@JsonKey(name: 'timestamp_now') int? get timestampNow;@JsonKey(name: 'time_now') String? get timeNow; bool? get process;
/// Create a copy of XtreamServerInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamServerInfoCopyWith<XtreamServerInfo> get copyWith => _$XtreamServerInfoCopyWithImpl<XtreamServerInfo>(this as XtreamServerInfo, _$identity);

  /// Serializes this XtreamServerInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamServerInfo&&(identical(other.url, url) || other.url == url)&&(identical(other.port, port) || other.port == port)&&(identical(other.httpsPort, httpsPort) || other.httpsPort == httpsPort)&&(identical(other.serverProtocol, serverProtocol) || other.serverProtocol == serverProtocol)&&(identical(other.rtmpPort, rtmpPort) || other.rtmpPort == rtmpPort)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.timestampNow, timestampNow) || other.timestampNow == timestampNow)&&(identical(other.timeNow, timeNow) || other.timeNow == timeNow)&&(identical(other.process, process) || other.process == process));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,port,httpsPort,serverProtocol,rtmpPort,timezone,timestampNow,timeNow,process);

@override
String toString() {
  return 'XtreamServerInfo(url: $url, port: $port, httpsPort: $httpsPort, serverProtocol: $serverProtocol, rtmpPort: $rtmpPort, timezone: $timezone, timestampNow: $timestampNow, timeNow: $timeNow, process: $process)';
}


}

/// @nodoc
abstract mixin class $XtreamServerInfoCopyWith<$Res>  {
  factory $XtreamServerInfoCopyWith(XtreamServerInfo value, $Res Function(XtreamServerInfo) _then) = _$XtreamServerInfoCopyWithImpl;
@useResult
$Res call({
 String? url, String? port,@JsonKey(name: 'https_port') String? httpsPort,@JsonKey(name: 'server_protocol') String? serverProtocol,@JsonKey(name: 'rtmp_port') String? rtmpPort, String? timezone,@JsonKey(name: 'timestamp_now') int? timestampNow,@JsonKey(name: 'time_now') String? timeNow, bool? process
});




}
/// @nodoc
class _$XtreamServerInfoCopyWithImpl<$Res>
    implements $XtreamServerInfoCopyWith<$Res> {
  _$XtreamServerInfoCopyWithImpl(this._self, this._then);

  final XtreamServerInfo _self;
  final $Res Function(XtreamServerInfo) _then;

/// Create a copy of XtreamServerInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? port = freezed,Object? httpsPort = freezed,Object? serverProtocol = freezed,Object? rtmpPort = freezed,Object? timezone = freezed,Object? timestampNow = freezed,Object? timeNow = freezed,Object? process = freezed,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String?,httpsPort: freezed == httpsPort ? _self.httpsPort : httpsPort // ignore: cast_nullable_to_non_nullable
as String?,serverProtocol: freezed == serverProtocol ? _self.serverProtocol : serverProtocol // ignore: cast_nullable_to_non_nullable
as String?,rtmpPort: freezed == rtmpPort ? _self.rtmpPort : rtmpPort // ignore: cast_nullable_to_non_nullable
as String?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,timestampNow: freezed == timestampNow ? _self.timestampNow : timestampNow // ignore: cast_nullable_to_non_nullable
as int?,timeNow: freezed == timeNow ? _self.timeNow : timeNow // ignore: cast_nullable_to_non_nullable
as String?,process: freezed == process ? _self.process : process // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamServerInfo].
extension XtreamServerInfoPatterns on XtreamServerInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamServerInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamServerInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamServerInfo value)  $default,){
final _that = this;
switch (_that) {
case _XtreamServerInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamServerInfo value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamServerInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? url,  String? port, @JsonKey(name: 'https_port')  String? httpsPort, @JsonKey(name: 'server_protocol')  String? serverProtocol, @JsonKey(name: 'rtmp_port')  String? rtmpPort,  String? timezone, @JsonKey(name: 'timestamp_now')  int? timestampNow, @JsonKey(name: 'time_now')  String? timeNow,  bool? process)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamServerInfo() when $default != null:
return $default(_that.url,_that.port,_that.httpsPort,_that.serverProtocol,_that.rtmpPort,_that.timezone,_that.timestampNow,_that.timeNow,_that.process);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? url,  String? port, @JsonKey(name: 'https_port')  String? httpsPort, @JsonKey(name: 'server_protocol')  String? serverProtocol, @JsonKey(name: 'rtmp_port')  String? rtmpPort,  String? timezone, @JsonKey(name: 'timestamp_now')  int? timestampNow, @JsonKey(name: 'time_now')  String? timeNow,  bool? process)  $default,) {final _that = this;
switch (_that) {
case _XtreamServerInfo():
return $default(_that.url,_that.port,_that.httpsPort,_that.serverProtocol,_that.rtmpPort,_that.timezone,_that.timestampNow,_that.timeNow,_that.process);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? url,  String? port, @JsonKey(name: 'https_port')  String? httpsPort, @JsonKey(name: 'server_protocol')  String? serverProtocol, @JsonKey(name: 'rtmp_port')  String? rtmpPort,  String? timezone, @JsonKey(name: 'timestamp_now')  int? timestampNow, @JsonKey(name: 'time_now')  String? timeNow,  bool? process)?  $default,) {final _that = this;
switch (_that) {
case _XtreamServerInfo() when $default != null:
return $default(_that.url,_that.port,_that.httpsPort,_that.serverProtocol,_that.rtmpPort,_that.timezone,_that.timestampNow,_that.timeNow,_that.process);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamServerInfo implements XtreamServerInfo {
  const _XtreamServerInfo({this.url, this.port, @JsonKey(name: 'https_port') this.httpsPort, @JsonKey(name: 'server_protocol') this.serverProtocol, @JsonKey(name: 'rtmp_port') this.rtmpPort, this.timezone, @JsonKey(name: 'timestamp_now') this.timestampNow, @JsonKey(name: 'time_now') this.timeNow, this.process});
  factory _XtreamServerInfo.fromJson(Map<String, dynamic> json) => _$XtreamServerInfoFromJson(json);

@override final  String? url;
@override final  String? port;
@override@JsonKey(name: 'https_port') final  String? httpsPort;
@override@JsonKey(name: 'server_protocol') final  String? serverProtocol;
@override@JsonKey(name: 'rtmp_port') final  String? rtmpPort;
@override final  String? timezone;
@override@JsonKey(name: 'timestamp_now') final  int? timestampNow;
@override@JsonKey(name: 'time_now') final  String? timeNow;
@override final  bool? process;

/// Create a copy of XtreamServerInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamServerInfoCopyWith<_XtreamServerInfo> get copyWith => __$XtreamServerInfoCopyWithImpl<_XtreamServerInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamServerInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamServerInfo&&(identical(other.url, url) || other.url == url)&&(identical(other.port, port) || other.port == port)&&(identical(other.httpsPort, httpsPort) || other.httpsPort == httpsPort)&&(identical(other.serverProtocol, serverProtocol) || other.serverProtocol == serverProtocol)&&(identical(other.rtmpPort, rtmpPort) || other.rtmpPort == rtmpPort)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.timestampNow, timestampNow) || other.timestampNow == timestampNow)&&(identical(other.timeNow, timeNow) || other.timeNow == timeNow)&&(identical(other.process, process) || other.process == process));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,port,httpsPort,serverProtocol,rtmpPort,timezone,timestampNow,timeNow,process);

@override
String toString() {
  return 'XtreamServerInfo(url: $url, port: $port, httpsPort: $httpsPort, serverProtocol: $serverProtocol, rtmpPort: $rtmpPort, timezone: $timezone, timestampNow: $timestampNow, timeNow: $timeNow, process: $process)';
}


}

/// @nodoc
abstract mixin class _$XtreamServerInfoCopyWith<$Res> implements $XtreamServerInfoCopyWith<$Res> {
  factory _$XtreamServerInfoCopyWith(_XtreamServerInfo value, $Res Function(_XtreamServerInfo) _then) = __$XtreamServerInfoCopyWithImpl;
@override @useResult
$Res call({
 String? url, String? port,@JsonKey(name: 'https_port') String? httpsPort,@JsonKey(name: 'server_protocol') String? serverProtocol,@JsonKey(name: 'rtmp_port') String? rtmpPort, String? timezone,@JsonKey(name: 'timestamp_now') int? timestampNow,@JsonKey(name: 'time_now') String? timeNow, bool? process
});




}
/// @nodoc
class __$XtreamServerInfoCopyWithImpl<$Res>
    implements _$XtreamServerInfoCopyWith<$Res> {
  __$XtreamServerInfoCopyWithImpl(this._self, this._then);

  final _XtreamServerInfo _self;
  final $Res Function(_XtreamServerInfo) _then;

/// Create a copy of XtreamServerInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? port = freezed,Object? httpsPort = freezed,Object? serverProtocol = freezed,Object? rtmpPort = freezed,Object? timezone = freezed,Object? timestampNow = freezed,Object? timeNow = freezed,Object? process = freezed,}) {
  return _then(_XtreamServerInfo(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String?,httpsPort: freezed == httpsPort ? _self.httpsPort : httpsPort // ignore: cast_nullable_to_non_nullable
as String?,serverProtocol: freezed == serverProtocol ? _self.serverProtocol : serverProtocol // ignore: cast_nullable_to_non_nullable
as String?,rtmpPort: freezed == rtmpPort ? _self.rtmpPort : rtmpPort // ignore: cast_nullable_to_non_nullable
as String?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,timestampNow: freezed == timestampNow ? _self.timestampNow : timestampNow // ignore: cast_nullable_to_non_nullable
as int?,timeNow: freezed == timeNow ? _self.timeNow : timeNow // ignore: cast_nullable_to_non_nullable
as String?,process: freezed == process ? _self.process : process // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
