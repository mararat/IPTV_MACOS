// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epg_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpgEntryModel {

 String get id; String get channelId; String get title; String get startTime; String get endTime; String? get description; String? get genre; String? get posterUrl;
/// Create a copy of EpgEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpgEntryModelCopyWith<EpgEntryModel> get copyWith => _$EpgEntryModelCopyWithImpl<EpgEntryModel>(this as EpgEntryModel, _$identity);

  /// Serializes this EpgEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpgEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.description, description) || other.description == description)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.posterUrl, posterUrl) || other.posterUrl == posterUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,channelId,title,startTime,endTime,description,genre,posterUrl);

@override
String toString() {
  return 'EpgEntryModel(id: $id, channelId: $channelId, title: $title, startTime: $startTime, endTime: $endTime, description: $description, genre: $genre, posterUrl: $posterUrl)';
}


}

/// @nodoc
abstract mixin class $EpgEntryModelCopyWith<$Res>  {
  factory $EpgEntryModelCopyWith(EpgEntryModel value, $Res Function(EpgEntryModel) _then) = _$EpgEntryModelCopyWithImpl;
@useResult
$Res call({
 String id, String channelId, String title, String startTime, String endTime, String? description, String? genre, String? posterUrl
});




}
/// @nodoc
class _$EpgEntryModelCopyWithImpl<$Res>
    implements $EpgEntryModelCopyWith<$Res> {
  _$EpgEntryModelCopyWithImpl(this._self, this._then);

  final EpgEntryModel _self;
  final $Res Function(EpgEntryModel) _then;

/// Create a copy of EpgEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? channelId = null,Object? title = null,Object? startTime = null,Object? endTime = null,Object? description = freezed,Object? genre = freezed,Object? posterUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,posterUrl: freezed == posterUrl ? _self.posterUrl : posterUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EpgEntryModel].
extension EpgEntryModelPatterns on EpgEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpgEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpgEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpgEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _EpgEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpgEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _EpgEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String channelId,  String title,  String startTime,  String endTime,  String? description,  String? genre,  String? posterUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpgEntryModel() when $default != null:
return $default(_that.id,_that.channelId,_that.title,_that.startTime,_that.endTime,_that.description,_that.genre,_that.posterUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String channelId,  String title,  String startTime,  String endTime,  String? description,  String? genre,  String? posterUrl)  $default,) {final _that = this;
switch (_that) {
case _EpgEntryModel():
return $default(_that.id,_that.channelId,_that.title,_that.startTime,_that.endTime,_that.description,_that.genre,_that.posterUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String channelId,  String title,  String startTime,  String endTime,  String? description,  String? genre,  String? posterUrl)?  $default,) {final _that = this;
switch (_that) {
case _EpgEntryModel() when $default != null:
return $default(_that.id,_that.channelId,_that.title,_that.startTime,_that.endTime,_that.description,_that.genre,_that.posterUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpgEntryModel implements EpgEntryModel {
  const _EpgEntryModel({required this.id, required this.channelId, required this.title, required this.startTime, required this.endTime, this.description, this.genre, this.posterUrl});
  factory _EpgEntryModel.fromJson(Map<String, dynamic> json) => _$EpgEntryModelFromJson(json);

@override final  String id;
@override final  String channelId;
@override final  String title;
@override final  String startTime;
@override final  String endTime;
@override final  String? description;
@override final  String? genre;
@override final  String? posterUrl;

/// Create a copy of EpgEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpgEntryModelCopyWith<_EpgEntryModel> get copyWith => __$EpgEntryModelCopyWithImpl<_EpgEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpgEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpgEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.description, description) || other.description == description)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.posterUrl, posterUrl) || other.posterUrl == posterUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,channelId,title,startTime,endTime,description,genre,posterUrl);

@override
String toString() {
  return 'EpgEntryModel(id: $id, channelId: $channelId, title: $title, startTime: $startTime, endTime: $endTime, description: $description, genre: $genre, posterUrl: $posterUrl)';
}


}

/// @nodoc
abstract mixin class _$EpgEntryModelCopyWith<$Res> implements $EpgEntryModelCopyWith<$Res> {
  factory _$EpgEntryModelCopyWith(_EpgEntryModel value, $Res Function(_EpgEntryModel) _then) = __$EpgEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String channelId, String title, String startTime, String endTime, String? description, String? genre, String? posterUrl
});




}
/// @nodoc
class __$EpgEntryModelCopyWithImpl<$Res>
    implements _$EpgEntryModelCopyWith<$Res> {
  __$EpgEntryModelCopyWithImpl(this._self, this._then);

  final _EpgEntryModel _self;
  final $Res Function(_EpgEntryModel) _then;

/// Create a copy of EpgEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? channelId = null,Object? title = null,Object? startTime = null,Object? endTime = null,Object? description = freezed,Object? genre = freezed,Object? posterUrl = freezed,}) {
  return _then(_EpgEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,posterUrl: freezed == posterUrl ? _self.posterUrl : posterUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
