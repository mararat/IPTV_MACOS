// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelModel {

 String get id; String get name; String? get logoUrl; String? get categoryId; int get streamId; String? get epgChannelId; int get tvArchive; int get tvArchiveDuration;
/// Create a copy of ChannelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChannelModelCopyWith<ChannelModel> get copyWith => _$ChannelModelCopyWithImpl<ChannelModel>(this as ChannelModel, _$identity);

  /// Serializes this ChannelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChannelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.epgChannelId, epgChannelId) || other.epgChannelId == epgChannelId)&&(identical(other.tvArchive, tvArchive) || other.tvArchive == tvArchive)&&(identical(other.tvArchiveDuration, tvArchiveDuration) || other.tvArchiveDuration == tvArchiveDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,categoryId,streamId,epgChannelId,tvArchive,tvArchiveDuration);

@override
String toString() {
  return 'ChannelModel(id: $id, name: $name, logoUrl: $logoUrl, categoryId: $categoryId, streamId: $streamId, epgChannelId: $epgChannelId, tvArchive: $tvArchive, tvArchiveDuration: $tvArchiveDuration)';
}


}

/// @nodoc
abstract mixin class $ChannelModelCopyWith<$Res>  {
  factory $ChannelModelCopyWith(ChannelModel value, $Res Function(ChannelModel) _then) = _$ChannelModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? logoUrl, String? categoryId, int streamId, String? epgChannelId, int tvArchive, int tvArchiveDuration
});




}
/// @nodoc
class _$ChannelModelCopyWithImpl<$Res>
    implements $ChannelModelCopyWith<$Res> {
  _$ChannelModelCopyWithImpl(this._self, this._then);

  final ChannelModel _self;
  final $Res Function(ChannelModel) _then;

/// Create a copy of ChannelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? categoryId = freezed,Object? streamId = null,Object? epgChannelId = freezed,Object? tvArchive = null,Object? tvArchiveDuration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,epgChannelId: freezed == epgChannelId ? _self.epgChannelId : epgChannelId // ignore: cast_nullable_to_non_nullable
as String?,tvArchive: null == tvArchive ? _self.tvArchive : tvArchive // ignore: cast_nullable_to_non_nullable
as int,tvArchiveDuration: null == tvArchiveDuration ? _self.tvArchiveDuration : tvArchiveDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChannelModel].
extension ChannelModelPatterns on ChannelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChannelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChannelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChannelModel value)  $default,){
final _that = this;
switch (_that) {
case _ChannelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChannelModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChannelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? logoUrl,  String? categoryId,  int streamId,  String? epgChannelId,  int tvArchive,  int tvArchiveDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChannelModel() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.categoryId,_that.streamId,_that.epgChannelId,_that.tvArchive,_that.tvArchiveDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? logoUrl,  String? categoryId,  int streamId,  String? epgChannelId,  int tvArchive,  int tvArchiveDuration)  $default,) {final _that = this;
switch (_that) {
case _ChannelModel():
return $default(_that.id,_that.name,_that.logoUrl,_that.categoryId,_that.streamId,_that.epgChannelId,_that.tvArchive,_that.tvArchiveDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? logoUrl,  String? categoryId,  int streamId,  String? epgChannelId,  int tvArchive,  int tvArchiveDuration)?  $default,) {final _that = this;
switch (_that) {
case _ChannelModel() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.categoryId,_that.streamId,_that.epgChannelId,_that.tvArchive,_that.tvArchiveDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChannelModel implements ChannelModel {
  const _ChannelModel({required this.id, required this.name, this.logoUrl, this.categoryId, this.streamId = 0, this.epgChannelId, this.tvArchive = 0, this.tvArchiveDuration = 0});
  factory _ChannelModel.fromJson(Map<String, dynamic> json) => _$ChannelModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? logoUrl;
@override final  String? categoryId;
@override@JsonKey() final  int streamId;
@override final  String? epgChannelId;
@override@JsonKey() final  int tvArchive;
@override@JsonKey() final  int tvArchiveDuration;

/// Create a copy of ChannelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChannelModelCopyWith<_ChannelModel> get copyWith => __$ChannelModelCopyWithImpl<_ChannelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChannelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChannelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.epgChannelId, epgChannelId) || other.epgChannelId == epgChannelId)&&(identical(other.tvArchive, tvArchive) || other.tvArchive == tvArchive)&&(identical(other.tvArchiveDuration, tvArchiveDuration) || other.tvArchiveDuration == tvArchiveDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,categoryId,streamId,epgChannelId,tvArchive,tvArchiveDuration);

@override
String toString() {
  return 'ChannelModel(id: $id, name: $name, logoUrl: $logoUrl, categoryId: $categoryId, streamId: $streamId, epgChannelId: $epgChannelId, tvArchive: $tvArchive, tvArchiveDuration: $tvArchiveDuration)';
}


}

/// @nodoc
abstract mixin class _$ChannelModelCopyWith<$Res> implements $ChannelModelCopyWith<$Res> {
  factory _$ChannelModelCopyWith(_ChannelModel value, $Res Function(_ChannelModel) _then) = __$ChannelModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? logoUrl, String? categoryId, int streamId, String? epgChannelId, int tvArchive, int tvArchiveDuration
});




}
/// @nodoc
class __$ChannelModelCopyWithImpl<$Res>
    implements _$ChannelModelCopyWith<$Res> {
  __$ChannelModelCopyWithImpl(this._self, this._then);

  final _ChannelModel _self;
  final $Res Function(_ChannelModel) _then;

/// Create a copy of ChannelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? categoryId = freezed,Object? streamId = null,Object? epgChannelId = freezed,Object? tvArchive = null,Object? tvArchiveDuration = null,}) {
  return _then(_ChannelModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,epgChannelId: freezed == epgChannelId ? _self.epgChannelId : epgChannelId // ignore: cast_nullable_to_non_nullable
as String?,tvArchive: null == tvArchive ? _self.tvArchive : tvArchive // ignore: cast_nullable_to_non_nullable
as int,tvArchiveDuration: null == tvArchiveDuration ? _self.tvArchiveDuration : tvArchiveDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
