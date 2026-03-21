// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChannelEntity {

 String get id; String get name; String? get logoUrl; String? get categoryId; int get streamId; String? get epgChannelId; bool get isFavorite; String? get currentProgram; int get tvArchive; int get tvArchiveDuration;
/// Create a copy of ChannelEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChannelEntityCopyWith<ChannelEntity> get copyWith => _$ChannelEntityCopyWithImpl<ChannelEntity>(this as ChannelEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChannelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.epgChannelId, epgChannelId) || other.epgChannelId == epgChannelId)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.currentProgram, currentProgram) || other.currentProgram == currentProgram)&&(identical(other.tvArchive, tvArchive) || other.tvArchive == tvArchive)&&(identical(other.tvArchiveDuration, tvArchiveDuration) || other.tvArchiveDuration == tvArchiveDuration));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,categoryId,streamId,epgChannelId,isFavorite,currentProgram,tvArchive,tvArchiveDuration);

@override
String toString() {
  return 'ChannelEntity(id: $id, name: $name, logoUrl: $logoUrl, categoryId: $categoryId, streamId: $streamId, epgChannelId: $epgChannelId, isFavorite: $isFavorite, currentProgram: $currentProgram, tvArchive: $tvArchive, tvArchiveDuration: $tvArchiveDuration)';
}


}

/// @nodoc
abstract mixin class $ChannelEntityCopyWith<$Res>  {
  factory $ChannelEntityCopyWith(ChannelEntity value, $Res Function(ChannelEntity) _then) = _$ChannelEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? logoUrl, String? categoryId, int streamId, String? epgChannelId, bool isFavorite, String? currentProgram, int tvArchive, int tvArchiveDuration
});




}
/// @nodoc
class _$ChannelEntityCopyWithImpl<$Res>
    implements $ChannelEntityCopyWith<$Res> {
  _$ChannelEntityCopyWithImpl(this._self, this._then);

  final ChannelEntity _self;
  final $Res Function(ChannelEntity) _then;

/// Create a copy of ChannelEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? categoryId = freezed,Object? streamId = null,Object? epgChannelId = freezed,Object? isFavorite = null,Object? currentProgram = freezed,Object? tvArchive = null,Object? tvArchiveDuration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,epgChannelId: freezed == epgChannelId ? _self.epgChannelId : epgChannelId // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,currentProgram: freezed == currentProgram ? _self.currentProgram : currentProgram // ignore: cast_nullable_to_non_nullable
as String?,tvArchive: null == tvArchive ? _self.tvArchive : tvArchive // ignore: cast_nullable_to_non_nullable
as int,tvArchiveDuration: null == tvArchiveDuration ? _self.tvArchiveDuration : tvArchiveDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChannelEntity].
extension ChannelEntityPatterns on ChannelEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChannelEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChannelEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChannelEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChannelEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChannelEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChannelEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? logoUrl,  String? categoryId,  int streamId,  String? epgChannelId,  bool isFavorite,  String? currentProgram,  int tvArchive,  int tvArchiveDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChannelEntity() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.categoryId,_that.streamId,_that.epgChannelId,_that.isFavorite,_that.currentProgram,_that.tvArchive,_that.tvArchiveDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? logoUrl,  String? categoryId,  int streamId,  String? epgChannelId,  bool isFavorite,  String? currentProgram,  int tvArchive,  int tvArchiveDuration)  $default,) {final _that = this;
switch (_that) {
case _ChannelEntity():
return $default(_that.id,_that.name,_that.logoUrl,_that.categoryId,_that.streamId,_that.epgChannelId,_that.isFavorite,_that.currentProgram,_that.tvArchive,_that.tvArchiveDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? logoUrl,  String? categoryId,  int streamId,  String? epgChannelId,  bool isFavorite,  String? currentProgram,  int tvArchive,  int tvArchiveDuration)?  $default,) {final _that = this;
switch (_that) {
case _ChannelEntity() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.categoryId,_that.streamId,_that.epgChannelId,_that.isFavorite,_that.currentProgram,_that.tvArchive,_that.tvArchiveDuration);case _:
  return null;

}
}

}

/// @nodoc


class _ChannelEntity implements ChannelEntity {
  const _ChannelEntity({required this.id, required this.name, this.logoUrl, this.categoryId, this.streamId = 0, this.epgChannelId, this.isFavorite = false, this.currentProgram, this.tvArchive = 0, this.tvArchiveDuration = 0});
  

@override final  String id;
@override final  String name;
@override final  String? logoUrl;
@override final  String? categoryId;
@override@JsonKey() final  int streamId;
@override final  String? epgChannelId;
@override@JsonKey() final  bool isFavorite;
@override final  String? currentProgram;
@override@JsonKey() final  int tvArchive;
@override@JsonKey() final  int tvArchiveDuration;

/// Create a copy of ChannelEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChannelEntityCopyWith<_ChannelEntity> get copyWith => __$ChannelEntityCopyWithImpl<_ChannelEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChannelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.epgChannelId, epgChannelId) || other.epgChannelId == epgChannelId)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.currentProgram, currentProgram) || other.currentProgram == currentProgram)&&(identical(other.tvArchive, tvArchive) || other.tvArchive == tvArchive)&&(identical(other.tvArchiveDuration, tvArchiveDuration) || other.tvArchiveDuration == tvArchiveDuration));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,categoryId,streamId,epgChannelId,isFavorite,currentProgram,tvArchive,tvArchiveDuration);

@override
String toString() {
  return 'ChannelEntity(id: $id, name: $name, logoUrl: $logoUrl, categoryId: $categoryId, streamId: $streamId, epgChannelId: $epgChannelId, isFavorite: $isFavorite, currentProgram: $currentProgram, tvArchive: $tvArchive, tvArchiveDuration: $tvArchiveDuration)';
}


}

/// @nodoc
abstract mixin class _$ChannelEntityCopyWith<$Res> implements $ChannelEntityCopyWith<$Res> {
  factory _$ChannelEntityCopyWith(_ChannelEntity value, $Res Function(_ChannelEntity) _then) = __$ChannelEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? logoUrl, String? categoryId, int streamId, String? epgChannelId, bool isFavorite, String? currentProgram, int tvArchive, int tvArchiveDuration
});




}
/// @nodoc
class __$ChannelEntityCopyWithImpl<$Res>
    implements _$ChannelEntityCopyWith<$Res> {
  __$ChannelEntityCopyWithImpl(this._self, this._then);

  final _ChannelEntity _self;
  final $Res Function(_ChannelEntity) _then;

/// Create a copy of ChannelEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? categoryId = freezed,Object? streamId = null,Object? epgChannelId = freezed,Object? isFavorite = null,Object? currentProgram = freezed,Object? tvArchive = null,Object? tvArchiveDuration = null,}) {
  return _then(_ChannelEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,epgChannelId: freezed == epgChannelId ? _self.epgChannelId : epgChannelId // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,currentProgram: freezed == currentProgram ? _self.currentProgram : currentProgram // ignore: cast_nullable_to_non_nullable
as String?,tvArchive: null == tvArchive ? _self.tvArchive : tvArchive // ignore: cast_nullable_to_non_nullable
as int,tvArchiveDuration: null == tvArchiveDuration ? _self.tvArchiveDuration : tvArchiveDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
