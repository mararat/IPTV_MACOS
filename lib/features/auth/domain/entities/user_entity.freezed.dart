// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEntity {

 String get username; String get status; String? get expDate; String? get isTrial; String? get activeCons; String? get createdAt; String? get maxConnections; List<String> get allowedOutputFormats;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.username, username) || other.username == username)&&(identical(other.status, status) || other.status == status)&&(identical(other.expDate, expDate) || other.expDate == expDate)&&(identical(other.isTrial, isTrial) || other.isTrial == isTrial)&&(identical(other.activeCons, activeCons) || other.activeCons == activeCons)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.maxConnections, maxConnections) || other.maxConnections == maxConnections)&&const DeepCollectionEquality().equals(other.allowedOutputFormats, allowedOutputFormats));
}


@override
int get hashCode => Object.hash(runtimeType,username,status,expDate,isTrial,activeCons,createdAt,maxConnections,const DeepCollectionEquality().hash(allowedOutputFormats));

@override
String toString() {
  return 'UserEntity(username: $username, status: $status, expDate: $expDate, isTrial: $isTrial, activeCons: $activeCons, createdAt: $createdAt, maxConnections: $maxConnections, allowedOutputFormats: $allowedOutputFormats)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 String username, String status, String? expDate, String? isTrial, String? activeCons, String? createdAt, String? maxConnections, List<String> allowedOutputFormats
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? status = null,Object? expDate = freezed,Object? isTrial = freezed,Object? activeCons = freezed,Object? createdAt = freezed,Object? maxConnections = freezed,Object? allowedOutputFormats = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expDate: freezed == expDate ? _self.expDate : expDate // ignore: cast_nullable_to_non_nullable
as String?,isTrial: freezed == isTrial ? _self.isTrial : isTrial // ignore: cast_nullable_to_non_nullable
as String?,activeCons: freezed == activeCons ? _self.activeCons : activeCons // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,maxConnections: freezed == maxConnections ? _self.maxConnections : maxConnections // ignore: cast_nullable_to_non_nullable
as String?,allowedOutputFormats: null == allowedOutputFormats ? _self.allowedOutputFormats : allowedOutputFormats // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String status,  String? expDate,  String? isTrial,  String? activeCons,  String? createdAt,  String? maxConnections,  List<String> allowedOutputFormats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.username,_that.status,_that.expDate,_that.isTrial,_that.activeCons,_that.createdAt,_that.maxConnections,_that.allowedOutputFormats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String status,  String? expDate,  String? isTrial,  String? activeCons,  String? createdAt,  String? maxConnections,  List<String> allowedOutputFormats)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.username,_that.status,_that.expDate,_that.isTrial,_that.activeCons,_that.createdAt,_that.maxConnections,_that.allowedOutputFormats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String status,  String? expDate,  String? isTrial,  String? activeCons,  String? createdAt,  String? maxConnections,  List<String> allowedOutputFormats)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.username,_that.status,_that.expDate,_that.isTrial,_that.activeCons,_that.createdAt,_that.maxConnections,_that.allowedOutputFormats);case _:
  return null;

}
}

}

/// @nodoc


class _UserEntity implements UserEntity {
  const _UserEntity({required this.username, required this.status, this.expDate, this.isTrial, this.activeCons, this.createdAt, this.maxConnections, final  List<String> allowedOutputFormats = const []}): _allowedOutputFormats = allowedOutputFormats;
  

@override final  String username;
@override final  String status;
@override final  String? expDate;
@override final  String? isTrial;
@override final  String? activeCons;
@override final  String? createdAt;
@override final  String? maxConnections;
 final  List<String> _allowedOutputFormats;
@override@JsonKey() List<String> get allowedOutputFormats {
  if (_allowedOutputFormats is EqualUnmodifiableListView) return _allowedOutputFormats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedOutputFormats);
}


/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.username, username) || other.username == username)&&(identical(other.status, status) || other.status == status)&&(identical(other.expDate, expDate) || other.expDate == expDate)&&(identical(other.isTrial, isTrial) || other.isTrial == isTrial)&&(identical(other.activeCons, activeCons) || other.activeCons == activeCons)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.maxConnections, maxConnections) || other.maxConnections == maxConnections)&&const DeepCollectionEquality().equals(other._allowedOutputFormats, _allowedOutputFormats));
}


@override
int get hashCode => Object.hash(runtimeType,username,status,expDate,isTrial,activeCons,createdAt,maxConnections,const DeepCollectionEquality().hash(_allowedOutputFormats));

@override
String toString() {
  return 'UserEntity(username: $username, status: $status, expDate: $expDate, isTrial: $isTrial, activeCons: $activeCons, createdAt: $createdAt, maxConnections: $maxConnections, allowedOutputFormats: $allowedOutputFormats)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 String username, String status, String? expDate, String? isTrial, String? activeCons, String? createdAt, String? maxConnections, List<String> allowedOutputFormats
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? status = null,Object? expDate = freezed,Object? isTrial = freezed,Object? activeCons = freezed,Object? createdAt = freezed,Object? maxConnections = freezed,Object? allowedOutputFormats = null,}) {
  return _then(_UserEntity(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expDate: freezed == expDate ? _self.expDate : expDate // ignore: cast_nullable_to_non_nullable
as String?,isTrial: freezed == isTrial ? _self.isTrial : isTrial // ignore: cast_nullable_to_non_nullable
as String?,activeCons: freezed == activeCons ? _self.activeCons : activeCons // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,maxConnections: freezed == maxConnections ? _self.maxConnections : maxConnections // ignore: cast_nullable_to_non_nullable
as String?,allowedOutputFormats: null == allowedOutputFormats ? _self._allowedOutputFormats : allowedOutputFormats // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
