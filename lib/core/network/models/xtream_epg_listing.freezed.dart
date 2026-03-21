// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xtream_epg_listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XtreamEpgListing {

 String? get id;@JsonKey(name: 'epg_id') String? get epgId; String? get title;@JsonKey(name: 'lang') String? get lang; String? get start; String? get end; String? get description;@JsonKey(name: 'channel_id') String? get channelId;@JsonKey(name: 'start_timestamp') String? get startTimestamp;@JsonKey(name: 'stop_timestamp') String? get stopTimestamp;@JsonKey(name: 'now_playing') int? get nowPlaying;@JsonKey(name: 'has_archive') int? get hasArchive;
/// Create a copy of XtreamEpgListing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamEpgListingCopyWith<XtreamEpgListing> get copyWith => _$XtreamEpgListingCopyWithImpl<XtreamEpgListing>(this as XtreamEpgListing, _$identity);

  /// Serializes this XtreamEpgListing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XtreamEpgListing&&(identical(other.id, id) || other.id == id)&&(identical(other.epgId, epgId) || other.epgId == epgId)&&(identical(other.title, title) || other.title == title)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.description, description) || other.description == description)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.startTimestamp, startTimestamp) || other.startTimestamp == startTimestamp)&&(identical(other.stopTimestamp, stopTimestamp) || other.stopTimestamp == stopTimestamp)&&(identical(other.nowPlaying, nowPlaying) || other.nowPlaying == nowPlaying)&&(identical(other.hasArchive, hasArchive) || other.hasArchive == hasArchive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,epgId,title,lang,start,end,description,channelId,startTimestamp,stopTimestamp,nowPlaying,hasArchive);

@override
String toString() {
  return 'XtreamEpgListing(id: $id, epgId: $epgId, title: $title, lang: $lang, start: $start, end: $end, description: $description, channelId: $channelId, startTimestamp: $startTimestamp, stopTimestamp: $stopTimestamp, nowPlaying: $nowPlaying, hasArchive: $hasArchive)';
}


}

/// @nodoc
abstract mixin class $XtreamEpgListingCopyWith<$Res>  {
  factory $XtreamEpgListingCopyWith(XtreamEpgListing value, $Res Function(XtreamEpgListing) _then) = _$XtreamEpgListingCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'epg_id') String? epgId, String? title,@JsonKey(name: 'lang') String? lang, String? start, String? end, String? description,@JsonKey(name: 'channel_id') String? channelId,@JsonKey(name: 'start_timestamp') String? startTimestamp,@JsonKey(name: 'stop_timestamp') String? stopTimestamp,@JsonKey(name: 'now_playing') int? nowPlaying,@JsonKey(name: 'has_archive') int? hasArchive
});




}
/// @nodoc
class _$XtreamEpgListingCopyWithImpl<$Res>
    implements $XtreamEpgListingCopyWith<$Res> {
  _$XtreamEpgListingCopyWithImpl(this._self, this._then);

  final XtreamEpgListing _self;
  final $Res Function(XtreamEpgListing) _then;

/// Create a copy of XtreamEpgListing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? epgId = freezed,Object? title = freezed,Object? lang = freezed,Object? start = freezed,Object? end = freezed,Object? description = freezed,Object? channelId = freezed,Object? startTimestamp = freezed,Object? stopTimestamp = freezed,Object? nowPlaying = freezed,Object? hasArchive = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,epgId: freezed == epgId ? _self.epgId : epgId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,channelId: freezed == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String?,startTimestamp: freezed == startTimestamp ? _self.startTimestamp : startTimestamp // ignore: cast_nullable_to_non_nullable
as String?,stopTimestamp: freezed == stopTimestamp ? _self.stopTimestamp : stopTimestamp // ignore: cast_nullable_to_non_nullable
as String?,nowPlaying: freezed == nowPlaying ? _self.nowPlaying : nowPlaying // ignore: cast_nullable_to_non_nullable
as int?,hasArchive: freezed == hasArchive ? _self.hasArchive : hasArchive // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [XtreamEpgListing].
extension XtreamEpgListingPatterns on XtreamEpgListing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XtreamEpgListing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XtreamEpgListing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XtreamEpgListing value)  $default,){
final _that = this;
switch (_that) {
case _XtreamEpgListing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XtreamEpgListing value)?  $default,){
final _that = this;
switch (_that) {
case _XtreamEpgListing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'epg_id')  String? epgId,  String? title, @JsonKey(name: 'lang')  String? lang,  String? start,  String? end,  String? description, @JsonKey(name: 'channel_id')  String? channelId, @JsonKey(name: 'start_timestamp')  String? startTimestamp, @JsonKey(name: 'stop_timestamp')  String? stopTimestamp, @JsonKey(name: 'now_playing')  int? nowPlaying, @JsonKey(name: 'has_archive')  int? hasArchive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XtreamEpgListing() when $default != null:
return $default(_that.id,_that.epgId,_that.title,_that.lang,_that.start,_that.end,_that.description,_that.channelId,_that.startTimestamp,_that.stopTimestamp,_that.nowPlaying,_that.hasArchive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'epg_id')  String? epgId,  String? title, @JsonKey(name: 'lang')  String? lang,  String? start,  String? end,  String? description, @JsonKey(name: 'channel_id')  String? channelId, @JsonKey(name: 'start_timestamp')  String? startTimestamp, @JsonKey(name: 'stop_timestamp')  String? stopTimestamp, @JsonKey(name: 'now_playing')  int? nowPlaying, @JsonKey(name: 'has_archive')  int? hasArchive)  $default,) {final _that = this;
switch (_that) {
case _XtreamEpgListing():
return $default(_that.id,_that.epgId,_that.title,_that.lang,_that.start,_that.end,_that.description,_that.channelId,_that.startTimestamp,_that.stopTimestamp,_that.nowPlaying,_that.hasArchive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'epg_id')  String? epgId,  String? title, @JsonKey(name: 'lang')  String? lang,  String? start,  String? end,  String? description, @JsonKey(name: 'channel_id')  String? channelId, @JsonKey(name: 'start_timestamp')  String? startTimestamp, @JsonKey(name: 'stop_timestamp')  String? stopTimestamp, @JsonKey(name: 'now_playing')  int? nowPlaying, @JsonKey(name: 'has_archive')  int? hasArchive)?  $default,) {final _that = this;
switch (_that) {
case _XtreamEpgListing() when $default != null:
return $default(_that.id,_that.epgId,_that.title,_that.lang,_that.start,_that.end,_that.description,_that.channelId,_that.startTimestamp,_that.stopTimestamp,_that.nowPlaying,_that.hasArchive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XtreamEpgListing extends XtreamEpgListing {
  const _XtreamEpgListing({this.id, @JsonKey(name: 'epg_id') this.epgId, this.title, @JsonKey(name: 'lang') this.lang, this.start, this.end, this.description, @JsonKey(name: 'channel_id') this.channelId, @JsonKey(name: 'start_timestamp') this.startTimestamp, @JsonKey(name: 'stop_timestamp') this.stopTimestamp, @JsonKey(name: 'now_playing') this.nowPlaying, @JsonKey(name: 'has_archive') this.hasArchive}): super._();
  factory _XtreamEpgListing.fromJson(Map<String, dynamic> json) => _$XtreamEpgListingFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'epg_id') final  String? epgId;
@override final  String? title;
@override@JsonKey(name: 'lang') final  String? lang;
@override final  String? start;
@override final  String? end;
@override final  String? description;
@override@JsonKey(name: 'channel_id') final  String? channelId;
@override@JsonKey(name: 'start_timestamp') final  String? startTimestamp;
@override@JsonKey(name: 'stop_timestamp') final  String? stopTimestamp;
@override@JsonKey(name: 'now_playing') final  int? nowPlaying;
@override@JsonKey(name: 'has_archive') final  int? hasArchive;

/// Create a copy of XtreamEpgListing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamEpgListingCopyWith<_XtreamEpgListing> get copyWith => __$XtreamEpgListingCopyWithImpl<_XtreamEpgListing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamEpgListingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XtreamEpgListing&&(identical(other.id, id) || other.id == id)&&(identical(other.epgId, epgId) || other.epgId == epgId)&&(identical(other.title, title) || other.title == title)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.description, description) || other.description == description)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.startTimestamp, startTimestamp) || other.startTimestamp == startTimestamp)&&(identical(other.stopTimestamp, stopTimestamp) || other.stopTimestamp == stopTimestamp)&&(identical(other.nowPlaying, nowPlaying) || other.nowPlaying == nowPlaying)&&(identical(other.hasArchive, hasArchive) || other.hasArchive == hasArchive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,epgId,title,lang,start,end,description,channelId,startTimestamp,stopTimestamp,nowPlaying,hasArchive);

@override
String toString() {
  return 'XtreamEpgListing(id: $id, epgId: $epgId, title: $title, lang: $lang, start: $start, end: $end, description: $description, channelId: $channelId, startTimestamp: $startTimestamp, stopTimestamp: $stopTimestamp, nowPlaying: $nowPlaying, hasArchive: $hasArchive)';
}


}

/// @nodoc
abstract mixin class _$XtreamEpgListingCopyWith<$Res> implements $XtreamEpgListingCopyWith<$Res> {
  factory _$XtreamEpgListingCopyWith(_XtreamEpgListing value, $Res Function(_XtreamEpgListing) _then) = __$XtreamEpgListingCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'epg_id') String? epgId, String? title,@JsonKey(name: 'lang') String? lang, String? start, String? end, String? description,@JsonKey(name: 'channel_id') String? channelId,@JsonKey(name: 'start_timestamp') String? startTimestamp,@JsonKey(name: 'stop_timestamp') String? stopTimestamp,@JsonKey(name: 'now_playing') int? nowPlaying,@JsonKey(name: 'has_archive') int? hasArchive
});




}
/// @nodoc
class __$XtreamEpgListingCopyWithImpl<$Res>
    implements _$XtreamEpgListingCopyWith<$Res> {
  __$XtreamEpgListingCopyWithImpl(this._self, this._then);

  final _XtreamEpgListing _self;
  final $Res Function(_XtreamEpgListing) _then;

/// Create a copy of XtreamEpgListing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? epgId = freezed,Object? title = freezed,Object? lang = freezed,Object? start = freezed,Object? end = freezed,Object? description = freezed,Object? channelId = freezed,Object? startTimestamp = freezed,Object? stopTimestamp = freezed,Object? nowPlaying = freezed,Object? hasArchive = freezed,}) {
  return _then(_XtreamEpgListing(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,epgId: freezed == epgId ? _self.epgId : epgId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,channelId: freezed == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String?,startTimestamp: freezed == startTimestamp ? _self.startTimestamp : startTimestamp // ignore: cast_nullable_to_non_nullable
as String?,stopTimestamp: freezed == stopTimestamp ? _self.stopTimestamp : stopTimestamp // ignore: cast_nullable_to_non_nullable
as String?,nowPlaying: freezed == nowPlaying ? _self.nowPlaying : nowPlaying // ignore: cast_nullable_to_non_nullable
as int?,hasArchive: freezed == hasArchive ? _self.hasArchive : hasArchive // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
