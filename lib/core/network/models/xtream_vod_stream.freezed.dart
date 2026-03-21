// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xtream_vod_stream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XtreamVodStream {

@JsonKey(name: 'num') int? get num; String get name;@JsonKey(name: 'stream_type') String? get streamType;@JsonKey(name: 'stream_id') int get streamId;@JsonKey(name: 'stream_icon') String? get streamIcon; double? get rating;@JsonKey(name: 'rating_5based') double? get rating5based; String? get added;@JsonKey(name: 'is_adult') String? get isAdult;@JsonKey(name: 'category_id') String? get categoryId;@JsonKey(name: 'container_extension') String? get containerExtension;@JsonKey(name: 'custom_sid') String? get customSid;@JsonKey(name: 'direct_source') String? get directSource;
/// Create a copy of XtreamVodStream
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamVodStreamCopyWith<XtreamVodStream> get copyWith => _$XtreamVodStreamCopyWithImpl<XtreamVodStream>(this as XtreamVodStream, _$identity);

  /// Serializes this XtreamVodStream to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamVodStream&&(identical(other.num, num) || other.num == num)&&(identical(other.name, name) || other.name == name)&&(identical(other.streamType, streamType) || other.streamType == streamType)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.streamIcon, streamIcon) || other.streamIcon == streamIcon)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.rating5based, rating5based) || other.rating5based == rating5based)&&(identical(other.added, added) || other.added == added)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.containerExtension, containerExtension) || other.containerExtension == containerExtension)&&(identical(other.customSid, customSid) || other.customSid == customSid)&&(identical(other.directSource, directSource) || other.directSource == directSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,num,name,streamType,streamId,streamIcon,rating,rating5based,added,isAdult,categoryId,containerExtension,customSid,directSource);

@override
String toString() {
  return 'XtreamVodStream(num: $num, name: $name, streamType: $streamType, streamId: $streamId, streamIcon: $streamIcon, rating: $rating, rating5based: $rating5based, added: $added, isAdult: $isAdult, categoryId: $categoryId, containerExtension: $containerExtension, customSid: $customSid, directSource: $directSource)';
}


}

/// @nodoc
abstract mixin class $XtreamVodStreamCopyWith<$Res>  {
  factory $XtreamVodStreamCopyWith(XtreamVodStream value, $Res Function(XtreamVodStream) _then) = _$XtreamVodStreamCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'num') int? num, String name,@JsonKey(name: 'stream_type') String? streamType,@JsonKey(name: 'stream_id') int streamId,@JsonKey(name: 'stream_icon') String? streamIcon, double? rating,@JsonKey(name: 'rating_5based') double? rating5based, String? added,@JsonKey(name: 'is_adult') String? isAdult,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'container_extension') String? containerExtension,@JsonKey(name: 'custom_sid') String? customSid,@JsonKey(name: 'direct_source') String? directSource
});




}
/// @nodoc
class _$XtreamVodStreamCopyWithImpl<$Res>
    implements $XtreamVodStreamCopyWith<$Res> {
  _$XtreamVodStreamCopyWithImpl(this._self, this._then);

  final XtreamVodStream _self;
  final $Res Function(XtreamVodStream) _then;

/// Create a copy of XtreamVodStream
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? num = freezed,Object? name = null,Object? streamType = freezed,Object? streamId = null,Object? streamIcon = freezed,Object? rating = freezed,Object? rating5based = freezed,Object? added = freezed,Object? isAdult = freezed,Object? categoryId = freezed,Object? containerExtension = freezed,Object? customSid = freezed,Object? directSource = freezed,}) {
  return _then(_self.copyWith(
num: freezed == num ? _self.num : num // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,streamType: freezed == streamType ? _self.streamType : streamType // ignore: cast_nullable_to_non_nullable
as String?,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,streamIcon: freezed == streamIcon ? _self.streamIcon : streamIcon // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,rating5based: freezed == rating5based ? _self.rating5based : rating5based // ignore: cast_nullable_to_non_nullable
as double?,added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as String?,isAdult: freezed == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,containerExtension: freezed == containerExtension ? _self.containerExtension : containerExtension // ignore: cast_nullable_to_non_nullable
as String?,customSid: freezed == customSid ? _self.customSid : customSid // ignore: cast_nullable_to_non_nullable
as String?,directSource: freezed == directSource ? _self.directSource : directSource // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamVodStream].
extension XtreamVodStreamPatterns on XtreamVodStream {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamVodStream value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamVodStream() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamVodStream value)  $default,){
final _that = this;
switch (_that) {
case _XtreamVodStream():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamVodStream value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamVodStream() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'num')  int? num,  String name, @JsonKey(name: 'stream_type')  String? streamType, @JsonKey(name: 'stream_id')  int streamId, @JsonKey(name: 'stream_icon')  String? streamIcon,  double? rating, @JsonKey(name: 'rating_5based')  double? rating5based,  String? added, @JsonKey(name: 'is_adult')  String? isAdult, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'container_extension')  String? containerExtension, @JsonKey(name: 'custom_sid')  String? customSid, @JsonKey(name: 'direct_source')  String? directSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamVodStream() when $default != null:
return $default(_that.num,_that.name,_that.streamType,_that.streamId,_that.streamIcon,_that.rating,_that.rating5based,_that.added,_that.isAdult,_that.categoryId,_that.containerExtension,_that.customSid,_that.directSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'num')  int? num,  String name, @JsonKey(name: 'stream_type')  String? streamType, @JsonKey(name: 'stream_id')  int streamId, @JsonKey(name: 'stream_icon')  String? streamIcon,  double? rating, @JsonKey(name: 'rating_5based')  double? rating5based,  String? added, @JsonKey(name: 'is_adult')  String? isAdult, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'container_extension')  String? containerExtension, @JsonKey(name: 'custom_sid')  String? customSid, @JsonKey(name: 'direct_source')  String? directSource)  $default,) {final _that = this;
switch (_that) {
case _XtreamVodStream():
return $default(_that.num,_that.name,_that.streamType,_that.streamId,_that.streamIcon,_that.rating,_that.rating5based,_that.added,_that.isAdult,_that.categoryId,_that.containerExtension,_that.customSid,_that.directSource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'num')  int? num,  String name, @JsonKey(name: 'stream_type')  String? streamType, @JsonKey(name: 'stream_id')  int streamId, @JsonKey(name: 'stream_icon')  String? streamIcon,  double? rating, @JsonKey(name: 'rating_5based')  double? rating5based,  String? added, @JsonKey(name: 'is_adult')  String? isAdult, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'container_extension')  String? containerExtension, @JsonKey(name: 'custom_sid')  String? customSid, @JsonKey(name: 'direct_source')  String? directSource)?  $default,) {final _that = this;
switch (_that) {
case _XtreamVodStream() when $default != null:
return $default(_that.num,_that.name,_that.streamType,_that.streamId,_that.streamIcon,_that.rating,_that.rating5based,_that.added,_that.isAdult,_that.categoryId,_that.containerExtension,_that.customSid,_that.directSource);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamVodStream implements XtreamVodStream {
  const _XtreamVodStream({@JsonKey(name: 'num') this.num, required this.name, @JsonKey(name: 'stream_type') this.streamType, @JsonKey(name: 'stream_id') required this.streamId, @JsonKey(name: 'stream_icon') this.streamIcon, this.rating, @JsonKey(name: 'rating_5based') this.rating5based, this.added, @JsonKey(name: 'is_adult') this.isAdult, @JsonKey(name: 'category_id') this.categoryId, @JsonKey(name: 'container_extension') this.containerExtension, @JsonKey(name: 'custom_sid') this.customSid, @JsonKey(name: 'direct_source') this.directSource});
  factory _XtreamVodStream.fromJson(Map<String, dynamic> json) => _$XtreamVodStreamFromJson(json);

@override@JsonKey(name: 'num') final  int? num;
@override final  String name;
@override@JsonKey(name: 'stream_type') final  String? streamType;
@override@JsonKey(name: 'stream_id') final  int streamId;
@override@JsonKey(name: 'stream_icon') final  String? streamIcon;
@override final  double? rating;
@override@JsonKey(name: 'rating_5based') final  double? rating5based;
@override final  String? added;
@override@JsonKey(name: 'is_adult') final  String? isAdult;
@override@JsonKey(name: 'category_id') final  String? categoryId;
@override@JsonKey(name: 'container_extension') final  String? containerExtension;
@override@JsonKey(name: 'custom_sid') final  String? customSid;
@override@JsonKey(name: 'direct_source') final  String? directSource;

/// Create a copy of XtreamVodStream
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamVodStreamCopyWith<_XtreamVodStream> get copyWith => __$XtreamVodStreamCopyWithImpl<_XtreamVodStream>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamVodStreamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamVodStream&&(identical(other.num, num) || other.num == num)&&(identical(other.name, name) || other.name == name)&&(identical(other.streamType, streamType) || other.streamType == streamType)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.streamIcon, streamIcon) || other.streamIcon == streamIcon)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.rating5based, rating5based) || other.rating5based == rating5based)&&(identical(other.added, added) || other.added == added)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.containerExtension, containerExtension) || other.containerExtension == containerExtension)&&(identical(other.customSid, customSid) || other.customSid == customSid)&&(identical(other.directSource, directSource) || other.directSource == directSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,num,name,streamType,streamId,streamIcon,rating,rating5based,added,isAdult,categoryId,containerExtension,customSid,directSource);

@override
String toString() {
  return 'XtreamVodStream(num: $num, name: $name, streamType: $streamType, streamId: $streamId, streamIcon: $streamIcon, rating: $rating, rating5based: $rating5based, added: $added, isAdult: $isAdult, categoryId: $categoryId, containerExtension: $containerExtension, customSid: $customSid, directSource: $directSource)';
}


}

/// @nodoc
abstract mixin class _$XtreamVodStreamCopyWith<$Res> implements $XtreamVodStreamCopyWith<$Res> {
  factory _$XtreamVodStreamCopyWith(_XtreamVodStream value, $Res Function(_XtreamVodStream) _then) = __$XtreamVodStreamCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'num') int? num, String name,@JsonKey(name: 'stream_type') String? streamType,@JsonKey(name: 'stream_id') int streamId,@JsonKey(name: 'stream_icon') String? streamIcon, double? rating,@JsonKey(name: 'rating_5based') double? rating5based, String? added,@JsonKey(name: 'is_adult') String? isAdult,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'container_extension') String? containerExtension,@JsonKey(name: 'custom_sid') String? customSid,@JsonKey(name: 'direct_source') String? directSource
});




}
/// @nodoc
class __$XtreamVodStreamCopyWithImpl<$Res>
    implements _$XtreamVodStreamCopyWith<$Res> {
  __$XtreamVodStreamCopyWithImpl(this._self, this._then);

  final _XtreamVodStream _self;
  final $Res Function(_XtreamVodStream) _then;

/// Create a copy of XtreamVodStream
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? num = freezed,Object? name = null,Object? streamType = freezed,Object? streamId = null,Object? streamIcon = freezed,Object? rating = freezed,Object? rating5based = freezed,Object? added = freezed,Object? isAdult = freezed,Object? categoryId = freezed,Object? containerExtension = freezed,Object? customSid = freezed,Object? directSource = freezed,}) {
  return _then(_XtreamVodStream(
num: freezed == num ? _self.num : num // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,streamType: freezed == streamType ? _self.streamType : streamType // ignore: cast_nullable_to_non_nullable
as String?,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,streamIcon: freezed == streamIcon ? _self.streamIcon : streamIcon // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,rating5based: freezed == rating5based ? _self.rating5based : rating5based // ignore: cast_nullable_to_non_nullable
as double?,added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as String?,isAdult: freezed == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,containerExtension: freezed == containerExtension ? _self.containerExtension : containerExtension // ignore: cast_nullable_to_non_nullable
as String?,customSid: freezed == customSid ? _self.customSid : customSid // ignore: cast_nullable_to_non_nullable
as String?,directSource: freezed == directSource ? _self.directSource : directSource // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
