// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xtream_live_stream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XtreamLiveStream {

@JsonKey(name: 'num') int? get num; String get name;@JsonKey(name: 'stream_type') String? get streamType;@JsonKey(name: 'stream_id') int get streamId;@JsonKey(name: 'stream_icon') String? get streamIcon;@JsonKey(name: 'epg_channel_id') String? get epgChannelId; String? get added;@JsonKey(name: 'is_adult') String? get isAdult;@JsonKey(name: 'category_id') String? get categoryId;@JsonKey(name: 'custom_sid') String? get customSid;@JsonKey(name: 'tv_archive') int? get tvArchive;@JsonKey(name: 'direct_source') String? get directSource;@JsonKey(name: 'tv_archive_duration') int? get tvArchiveDuration;
/// Create a copy of XtreamLiveStream
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamLiveStreamCopyWith<XtreamLiveStream> get copyWith => _$XtreamLiveStreamCopyWithImpl<XtreamLiveStream>(this as XtreamLiveStream, _$identity);

  /// Serializes this XtreamLiveStream to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamLiveStream&&(identical(other.num, num) || other.num == num)&&(identical(other.name, name) || other.name == name)&&(identical(other.streamType, streamType) || other.streamType == streamType)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.streamIcon, streamIcon) || other.streamIcon == streamIcon)&&(identical(other.epgChannelId, epgChannelId) || other.epgChannelId == epgChannelId)&&(identical(other.added, added) || other.added == added)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.customSid, customSid) || other.customSid == customSid)&&(identical(other.tvArchive, tvArchive) || other.tvArchive == tvArchive)&&(identical(other.directSource, directSource) || other.directSource == directSource)&&(identical(other.tvArchiveDuration, tvArchiveDuration) || other.tvArchiveDuration == tvArchiveDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,num,name,streamType,streamId,streamIcon,epgChannelId,added,isAdult,categoryId,customSid,tvArchive,directSource,tvArchiveDuration);

@override
String toString() {
  return 'XtreamLiveStream(num: $num, name: $name, streamType: $streamType, streamId: $streamId, streamIcon: $streamIcon, epgChannelId: $epgChannelId, added: $added, isAdult: $isAdult, categoryId: $categoryId, customSid: $customSid, tvArchive: $tvArchive, directSource: $directSource, tvArchiveDuration: $tvArchiveDuration)';
}


}

/// @nodoc
abstract mixin class $XtreamLiveStreamCopyWith<$Res>  {
  factory $XtreamLiveStreamCopyWith(XtreamLiveStream value, $Res Function(XtreamLiveStream) _then) = _$XtreamLiveStreamCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'num') int? num, String name,@JsonKey(name: 'stream_type') String? streamType,@JsonKey(name: 'stream_id') int streamId,@JsonKey(name: 'stream_icon') String? streamIcon,@JsonKey(name: 'epg_channel_id') String? epgChannelId, String? added,@JsonKey(name: 'is_adult') String? isAdult,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'custom_sid') String? customSid,@JsonKey(name: 'tv_archive') int? tvArchive,@JsonKey(name: 'direct_source') String? directSource,@JsonKey(name: 'tv_archive_duration') int? tvArchiveDuration
});




}
/// @nodoc
class _$XtreamLiveStreamCopyWithImpl<$Res>
    implements $XtreamLiveStreamCopyWith<$Res> {
  _$XtreamLiveStreamCopyWithImpl(this._self, this._then);

  final XtreamLiveStream _self;
  final $Res Function(XtreamLiveStream) _then;

/// Create a copy of XtreamLiveStream
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? num = freezed,Object? name = null,Object? streamType = freezed,Object? streamId = null,Object? streamIcon = freezed,Object? epgChannelId = freezed,Object? added = freezed,Object? isAdult = freezed,Object? categoryId = freezed,Object? customSid = freezed,Object? tvArchive = freezed,Object? directSource = freezed,Object? tvArchiveDuration = freezed,}) {
  return _then(_self.copyWith(
num: freezed == num ? _self.num : num // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,streamType: freezed == streamType ? _self.streamType : streamType // ignore: cast_nullable_to_non_nullable
as String?,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,streamIcon: freezed == streamIcon ? _self.streamIcon : streamIcon // ignore: cast_nullable_to_non_nullable
as String?,epgChannelId: freezed == epgChannelId ? _self.epgChannelId : epgChannelId // ignore: cast_nullable_to_non_nullable
as String?,added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as String?,isAdult: freezed == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,customSid: freezed == customSid ? _self.customSid : customSid // ignore: cast_nullable_to_non_nullable
as String?,tvArchive: freezed == tvArchive ? _self.tvArchive : tvArchive // ignore: cast_nullable_to_non_nullable
as int?,directSource: freezed == directSource ? _self.directSource : directSource // ignore: cast_nullable_to_non_nullable
as String?,tvArchiveDuration: freezed == tvArchiveDuration ? _self.tvArchiveDuration : tvArchiveDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamLiveStream].
extension XtreamLiveStreamPatterns on XtreamLiveStream {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamLiveStream value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamLiveStream() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamLiveStream value)  $default,){
final _that = this;
switch (_that) {
case _XtreamLiveStream():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamLiveStream value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamLiveStream() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'num')  int? num,  String name, @JsonKey(name: 'stream_type')  String? streamType, @JsonKey(name: 'stream_id')  int streamId, @JsonKey(name: 'stream_icon')  String? streamIcon, @JsonKey(name: 'epg_channel_id')  String? epgChannelId,  String? added, @JsonKey(name: 'is_adult')  String? isAdult, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'custom_sid')  String? customSid, @JsonKey(name: 'tv_archive')  int? tvArchive, @JsonKey(name: 'direct_source')  String? directSource, @JsonKey(name: 'tv_archive_duration')  int? tvArchiveDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamLiveStream() when $default != null:
return $default(_that.num,_that.name,_that.streamType,_that.streamId,_that.streamIcon,_that.epgChannelId,_that.added,_that.isAdult,_that.categoryId,_that.customSid,_that.tvArchive,_that.directSource,_that.tvArchiveDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'num')  int? num,  String name, @JsonKey(name: 'stream_type')  String? streamType, @JsonKey(name: 'stream_id')  int streamId, @JsonKey(name: 'stream_icon')  String? streamIcon, @JsonKey(name: 'epg_channel_id')  String? epgChannelId,  String? added, @JsonKey(name: 'is_adult')  String? isAdult, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'custom_sid')  String? customSid, @JsonKey(name: 'tv_archive')  int? tvArchive, @JsonKey(name: 'direct_source')  String? directSource, @JsonKey(name: 'tv_archive_duration')  int? tvArchiveDuration)  $default,) {final _that = this;
switch (_that) {
case _XtreamLiveStream():
return $default(_that.num,_that.name,_that.streamType,_that.streamId,_that.streamIcon,_that.epgChannelId,_that.added,_that.isAdult,_that.categoryId,_that.customSid,_that.tvArchive,_that.directSource,_that.tvArchiveDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'num')  int? num,  String name, @JsonKey(name: 'stream_type')  String? streamType, @JsonKey(name: 'stream_id')  int streamId, @JsonKey(name: 'stream_icon')  String? streamIcon, @JsonKey(name: 'epg_channel_id')  String? epgChannelId,  String? added, @JsonKey(name: 'is_adult')  String? isAdult, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'custom_sid')  String? customSid, @JsonKey(name: 'tv_archive')  int? tvArchive, @JsonKey(name: 'direct_source')  String? directSource, @JsonKey(name: 'tv_archive_duration')  int? tvArchiveDuration)?  $default,) {final _that = this;
switch (_that) {
case _XtreamLiveStream() when $default != null:
return $default(_that.num,_that.name,_that.streamType,_that.streamId,_that.streamIcon,_that.epgChannelId,_that.added,_that.isAdult,_that.categoryId,_that.customSid,_that.tvArchive,_that.directSource,_that.tvArchiveDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamLiveStream implements XtreamLiveStream {
  const _XtreamLiveStream({@JsonKey(name: 'num') this.num, required this.name, @JsonKey(name: 'stream_type') this.streamType, @JsonKey(name: 'stream_id') required this.streamId, @JsonKey(name: 'stream_icon') this.streamIcon, @JsonKey(name: 'epg_channel_id') this.epgChannelId, this.added, @JsonKey(name: 'is_adult') this.isAdult, @JsonKey(name: 'category_id') this.categoryId, @JsonKey(name: 'custom_sid') this.customSid, @JsonKey(name: 'tv_archive') this.tvArchive, @JsonKey(name: 'direct_source') this.directSource, @JsonKey(name: 'tv_archive_duration') this.tvArchiveDuration});
  factory _XtreamLiveStream.fromJson(Map<String, dynamic> json) => _$XtreamLiveStreamFromJson(json);

@override@JsonKey(name: 'num') final  int? num;
@override final  String name;
@override@JsonKey(name: 'stream_type') final  String? streamType;
@override@JsonKey(name: 'stream_id') final  int streamId;
@override@JsonKey(name: 'stream_icon') final  String? streamIcon;
@override@JsonKey(name: 'epg_channel_id') final  String? epgChannelId;
@override final  String? added;
@override@JsonKey(name: 'is_adult') final  String? isAdult;
@override@JsonKey(name: 'category_id') final  String? categoryId;
@override@JsonKey(name: 'custom_sid') final  String? customSid;
@override@JsonKey(name: 'tv_archive') final  int? tvArchive;
@override@JsonKey(name: 'direct_source') final  String? directSource;
@override@JsonKey(name: 'tv_archive_duration') final  int? tvArchiveDuration;

/// Create a copy of XtreamLiveStream
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamLiveStreamCopyWith<_XtreamLiveStream> get copyWith => __$XtreamLiveStreamCopyWithImpl<_XtreamLiveStream>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamLiveStreamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamLiveStream&&(identical(other.num, num) || other.num == num)&&(identical(other.name, name) || other.name == name)&&(identical(other.streamType, streamType) || other.streamType == streamType)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.streamIcon, streamIcon) || other.streamIcon == streamIcon)&&(identical(other.epgChannelId, epgChannelId) || other.epgChannelId == epgChannelId)&&(identical(other.added, added) || other.added == added)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.customSid, customSid) || other.customSid == customSid)&&(identical(other.tvArchive, tvArchive) || other.tvArchive == tvArchive)&&(identical(other.directSource, directSource) || other.directSource == directSource)&&(identical(other.tvArchiveDuration, tvArchiveDuration) || other.tvArchiveDuration == tvArchiveDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,num,name,streamType,streamId,streamIcon,epgChannelId,added,isAdult,categoryId,customSid,tvArchive,directSource,tvArchiveDuration);

@override
String toString() {
  return 'XtreamLiveStream(num: $num, name: $name, streamType: $streamType, streamId: $streamId, streamIcon: $streamIcon, epgChannelId: $epgChannelId, added: $added, isAdult: $isAdult, categoryId: $categoryId, customSid: $customSid, tvArchive: $tvArchive, directSource: $directSource, tvArchiveDuration: $tvArchiveDuration)';
}


}

/// @nodoc
abstract mixin class _$XtreamLiveStreamCopyWith<$Res> implements $XtreamLiveStreamCopyWith<$Res> {
  factory _$XtreamLiveStreamCopyWith(_XtreamLiveStream value, $Res Function(_XtreamLiveStream) _then) = __$XtreamLiveStreamCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'num') int? num, String name,@JsonKey(name: 'stream_type') String? streamType,@JsonKey(name: 'stream_id') int streamId,@JsonKey(name: 'stream_icon') String? streamIcon,@JsonKey(name: 'epg_channel_id') String? epgChannelId, String? added,@JsonKey(name: 'is_adult') String? isAdult,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'custom_sid') String? customSid,@JsonKey(name: 'tv_archive') int? tvArchive,@JsonKey(name: 'direct_source') String? directSource,@JsonKey(name: 'tv_archive_duration') int? tvArchiveDuration
});




}
/// @nodoc
class __$XtreamLiveStreamCopyWithImpl<$Res>
    implements _$XtreamLiveStreamCopyWith<$Res> {
  __$XtreamLiveStreamCopyWithImpl(this._self, this._then);

  final _XtreamLiveStream _self;
  final $Res Function(_XtreamLiveStream) _then;

/// Create a copy of XtreamLiveStream
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? num = freezed,Object? name = null,Object? streamType = freezed,Object? streamId = null,Object? streamIcon = freezed,Object? epgChannelId = freezed,Object? added = freezed,Object? isAdult = freezed,Object? categoryId = freezed,Object? customSid = freezed,Object? tvArchive = freezed,Object? directSource = freezed,Object? tvArchiveDuration = freezed,}) {
  return _then(_XtreamLiveStream(
num: freezed == num ? _self.num : num // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,streamType: freezed == streamType ? _self.streamType : streamType // ignore: cast_nullable_to_non_nullable
as String?,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,streamIcon: freezed == streamIcon ? _self.streamIcon : streamIcon // ignore: cast_nullable_to_non_nullable
as String?,epgChannelId: freezed == epgChannelId ? _self.epgChannelId : epgChannelId // ignore: cast_nullable_to_non_nullable
as String?,added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as String?,isAdult: freezed == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,customSid: freezed == customSid ? _self.customSid : customSid // ignore: cast_nullable_to_non_nullable
as String?,tvArchive: freezed == tvArchive ? _self.tvArchive : tvArchive // ignore: cast_nullable_to_non_nullable
as int?,directSource: freezed == directSource ? _self.directSource : directSource // ignore: cast_nullable_to_non_nullable
as String?,tvArchiveDuration: freezed == tvArchiveDuration ? _self.tvArchiveDuration : tvArchiveDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
