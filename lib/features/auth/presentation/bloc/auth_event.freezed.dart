// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthCheckAuth value)?  checkAuth,TResult Function( AuthLogin value)?  login,TResult Function( AuthLogout value)?  logout,TResult Function( AuthRefreshData value)?  refreshData,TResult Function( AuthPreloadCounts value)?  preloadCounts,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthCheckAuth() when checkAuth != null:
return checkAuth(_that);case AuthLogin() when login != null:
return login(_that);case AuthLogout() when logout != null:
return logout(_that);case AuthRefreshData() when refreshData != null:
return refreshData(_that);case AuthPreloadCounts() when preloadCounts != null:
return preloadCounts(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthCheckAuth value)  checkAuth,required TResult Function( AuthLogin value)  login,required TResult Function( AuthLogout value)  logout,required TResult Function( AuthRefreshData value)  refreshData,required TResult Function( AuthPreloadCounts value)  preloadCounts,}){
final _that = this;
switch (_that) {
case AuthCheckAuth():
return checkAuth(_that);case AuthLogin():
return login(_that);case AuthLogout():
return logout(_that);case AuthRefreshData():
return refreshData(_that);case AuthPreloadCounts():
return preloadCounts(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthCheckAuth value)?  checkAuth,TResult? Function( AuthLogin value)?  login,TResult? Function( AuthLogout value)?  logout,TResult? Function( AuthRefreshData value)?  refreshData,TResult? Function( AuthPreloadCounts value)?  preloadCounts,}){
final _that = this;
switch (_that) {
case AuthCheckAuth() when checkAuth != null:
return checkAuth(_that);case AuthLogin() when login != null:
return login(_that);case AuthLogout() when logout != null:
return logout(_that);case AuthRefreshData() when refreshData != null:
return refreshData(_that);case AuthPreloadCounts() when preloadCounts != null:
return preloadCounts(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkAuth,TResult Function( String serverUrl,  String username,  String password)?  login,TResult Function()?  logout,TResult Function()?  refreshData,TResult Function()?  preloadCounts,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthCheckAuth() when checkAuth != null:
return checkAuth();case AuthLogin() when login != null:
return login(_that.serverUrl,_that.username,_that.password);case AuthLogout() when logout != null:
return logout();case AuthRefreshData() when refreshData != null:
return refreshData();case AuthPreloadCounts() when preloadCounts != null:
return preloadCounts();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkAuth,required TResult Function( String serverUrl,  String username,  String password)  login,required TResult Function()  logout,required TResult Function()  refreshData,required TResult Function()  preloadCounts,}) {final _that = this;
switch (_that) {
case AuthCheckAuth():
return checkAuth();case AuthLogin():
return login(_that.serverUrl,_that.username,_that.password);case AuthLogout():
return logout();case AuthRefreshData():
return refreshData();case AuthPreloadCounts():
return preloadCounts();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkAuth,TResult? Function( String serverUrl,  String username,  String password)?  login,TResult? Function()?  logout,TResult? Function()?  refreshData,TResult? Function()?  preloadCounts,}) {final _that = this;
switch (_that) {
case AuthCheckAuth() when checkAuth != null:
return checkAuth();case AuthLogin() when login != null:
return login(_that.serverUrl,_that.username,_that.password);case AuthLogout() when logout != null:
return logout();case AuthRefreshData() when refreshData != null:
return refreshData();case AuthPreloadCounts() when preloadCounts != null:
return preloadCounts();case _:
  return null;

}
}

}

/// @nodoc


class AuthCheckAuth implements AuthEvent {
  const AuthCheckAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCheckAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkAuth()';
}


}




/// @nodoc


class AuthLogin implements AuthEvent {
  const AuthLogin({required this.serverUrl, required this.username, required this.password});
  

 final  String serverUrl;
 final  String username;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginCopyWith<AuthLogin> get copyWith => _$AuthLoginCopyWithImpl<AuthLogin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogin&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,username,password);

@override
String toString() {
  return 'AuthEvent.login(serverUrl: $serverUrl, username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthLoginCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthLoginCopyWith(AuthLogin value, $Res Function(AuthLogin) _then) = _$AuthLoginCopyWithImpl;
@useResult
$Res call({
 String serverUrl, String username, String password
});




}
/// @nodoc
class _$AuthLoginCopyWithImpl<$Res>
    implements $AuthLoginCopyWith<$Res> {
  _$AuthLoginCopyWithImpl(this._self, this._then);

  final AuthLogin _self;
  final $Res Function(AuthLogin) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serverUrl = null,Object? username = null,Object? password = null,}) {
  return _then(AuthLogin(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthLogout implements AuthEvent {
  const AuthLogout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




/// @nodoc


class AuthRefreshData implements AuthEvent {
  const AuthRefreshData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRefreshData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.refreshData()';
}


}




/// @nodoc


class AuthPreloadCounts implements AuthEvent {
  const AuthPreloadCounts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthPreloadCounts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.preloadCounts()';
}


}




// dart format on
