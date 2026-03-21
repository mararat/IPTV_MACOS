// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epg_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EpgEntry {

 String get id; String get channelId; String get title; DateTime get startTime; DateTime get endTime; String? get description; String? get genre; String? get posterUrl;
/// Create a copy of EpgEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpgEntryCopyWith<EpgEntry> get copyWith => _$EpgEntryCopyWithImpl<EpgEntry>(this as EpgEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpgEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.description, description) || other.description == description)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.posterUrl, posterUrl) || other.posterUrl == posterUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,channelId,title,startTime,endTime,description,genre,posterUrl);

@override
String toString() {
  return 'EpgEntry(id: $id, channelId: $channelId, title: $title, startTime: $startTime, endTime: $endTime, description: $description, genre: $genre, posterUrl: $posterUrl)';
}


}

/// @nodoc
abstract mixin class $EpgEntryCopyWith<$Res>  {
  factory $EpgEntryCopyWith(EpgEntry value, $Res Function(EpgEntry) _then) = _$EpgEntryCopyWithImpl;
@useResult
$Res call({
 String id, String channelId, String title, DateTime startTime, DateTime endTime, String? description, String? genre, String? posterUrl
});




}
/// @nodoc
class _$EpgEntryCopyWithImpl<$Res>
    implements $EpgEntryCopyWith<$Res> {
  _$EpgEntryCopyWithImpl(this._self, this._then);

  final EpgEntry _self;
  final $Res Function(EpgEntry) _then;

/// Create a copy of EpgEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? channelId = null,Object? title = null,Object? startTime = null,Object? endTime = null,Object? description = freezed,Object? genre = freezed,Object? posterUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,posterUrl: freezed == posterUrl ? _self.posterUrl : posterUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EpgEntry].
extension EpgEntryPatterns on EpgEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpgEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpgEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpgEntry value)  $default,){
final _that = this;
switch (_that) {
case _EpgEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpgEntry value)?  $default,){
final _that = this;
switch (_that) {
case _EpgEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String channelId,  String title,  DateTime startTime,  DateTime endTime,  String? description,  String? genre,  String? posterUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpgEntry() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String channelId,  String title,  DateTime startTime,  DateTime endTime,  String? description,  String? genre,  String? posterUrl)  $default,) {final _that = this;
switch (_that) {
case _EpgEntry():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String channelId,  String title,  DateTime startTime,  DateTime endTime,  String? description,  String? genre,  String? posterUrl)?  $default,) {final _that = this;
switch (_that) {
case _EpgEntry() when $default != null:
return $default(_that.id,_that.channelId,_that.title,_that.startTime,_that.endTime,_that.description,_that.genre,_that.posterUrl);case _:
  return null;

}
}

}

/// @nodoc


class _EpgEntry implements EpgEntry {
  const _EpgEntry({required this.id, required this.channelId, required this.title, required this.startTime, required this.endTime, this.description, this.genre, this.posterUrl});
  

@override final  String id;
@override final  String channelId;
@override final  String title;
@override final  DateTime startTime;
@override final  DateTime endTime;
@override final  String? description;
@override final  String? genre;
@override final  String? posterUrl;

/// Create a copy of EpgEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpgEntryCopyWith<_EpgEntry> get copyWith => __$EpgEntryCopyWithImpl<_EpgEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpgEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.description, description) || other.description == description)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.posterUrl, posterUrl) || other.posterUrl == posterUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,channelId,title,startTime,endTime,description,genre,posterUrl);

@override
String toString() {
  return 'EpgEntry(id: $id, channelId: $channelId, title: $title, startTime: $startTime, endTime: $endTime, description: $description, genre: $genre, posterUrl: $posterUrl)';
}


}

/// @nodoc
abstract mixin class _$EpgEntryCopyWith<$Res> implements $EpgEntryCopyWith<$Res> {
  factory _$EpgEntryCopyWith(_EpgEntry value, $Res Function(_EpgEntry) _then) = __$EpgEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String channelId, String title, DateTime startTime, DateTime endTime, String? description, String? genre, String? posterUrl
});




}
/// @nodoc
class __$EpgEntryCopyWithImpl<$Res>
    implements _$EpgEntryCopyWith<$Res> {
  __$EpgEntryCopyWithImpl(this._self, this._then);

  final _EpgEntry _self;
  final $Res Function(_EpgEntry) _then;

/// Create a copy of EpgEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? channelId = null,Object? title = null,Object? startTime = null,Object? endTime = null,Object? description = freezed,Object? genre = freezed,Object? posterUrl = freezed,}) {
  return _then(_EpgEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,posterUrl: freezed == posterUrl ? _self.posterUrl : posterUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
