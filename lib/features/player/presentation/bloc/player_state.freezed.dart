// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaTrack {

 String get id; String get title; String get language;
/// Create a copy of MediaTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaTrackCopyWith<MediaTrack> get copyWith => _$MediaTrackCopyWithImpl<MediaTrack>(this as MediaTrack, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaTrack&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,language);

@override
String toString() {
  return 'MediaTrack(id: $id, title: $title, language: $language)';
}


}

/// @nodoc
abstract mixin class $MediaTrackCopyWith<$Res>  {
  factory $MediaTrackCopyWith(MediaTrack value, $Res Function(MediaTrack) _then) = _$MediaTrackCopyWithImpl;
@useResult
$Res call({
 String id, String title, String language
});




}
/// @nodoc
class _$MediaTrackCopyWithImpl<$Res>
    implements $MediaTrackCopyWith<$Res> {
  _$MediaTrackCopyWithImpl(this._self, this._then);

  final MediaTrack _self;
  final $Res Function(MediaTrack) _then;

/// Create a copy of MediaTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? language = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaTrack].
extension MediaTrackPatterns on MediaTrack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaTrack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaTrack value)  $default,){
final _that = this;
switch (_that) {
case _MediaTrack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaTrack value)?  $default,){
final _that = this;
switch (_that) {
case _MediaTrack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaTrack() when $default != null:
return $default(_that.id,_that.title,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String language)  $default,) {final _that = this;
switch (_that) {
case _MediaTrack():
return $default(_that.id,_that.title,_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String language)?  $default,) {final _that = this;
switch (_that) {
case _MediaTrack() when $default != null:
return $default(_that.id,_that.title,_that.language);case _:
  return null;

}
}

}

/// @nodoc


class _MediaTrack implements MediaTrack {
  const _MediaTrack({required this.id, required this.title, this.language = ''});
  

@override final  String id;
@override final  String title;
@override@JsonKey() final  String language;

/// Create a copy of MediaTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaTrackCopyWith<_MediaTrack> get copyWith => __$MediaTrackCopyWithImpl<_MediaTrack>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaTrack&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,language);

@override
String toString() {
  return 'MediaTrack(id: $id, title: $title, language: $language)';
}


}

/// @nodoc
abstract mixin class _$MediaTrackCopyWith<$Res> implements $MediaTrackCopyWith<$Res> {
  factory _$MediaTrackCopyWith(_MediaTrack value, $Res Function(_MediaTrack) _then) = __$MediaTrackCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String language
});




}
/// @nodoc
class __$MediaTrackCopyWithImpl<$Res>
    implements _$MediaTrackCopyWith<$Res> {
  __$MediaTrackCopyWithImpl(this._self, this._then);

  final _MediaTrack _self;
  final $Res Function(_MediaTrack) _then;

/// Create a copy of MediaTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? language = null,}) {
  return _then(_MediaTrack(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PlayerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerState()';
}


}

/// @nodoc
class $PlayerStateCopyWith<$Res>  {
$PlayerStateCopyWith(PlayerState _, $Res Function(PlayerState) __);
}


/// Adds pattern-matching-related methods to [PlayerState].
extension PlayerStatePatterns on PlayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlayerIdle value)?  idle,TResult Function( PlayerLoading value)?  loading,TResult Function( PlayerPlaying value)?  playing,TResult Function( PlayerError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlayerIdle() when idle != null:
return idle(_that);case PlayerLoading() when loading != null:
return loading(_that);case PlayerPlaying() when playing != null:
return playing(_that);case PlayerError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlayerIdle value)  idle,required TResult Function( PlayerLoading value)  loading,required TResult Function( PlayerPlaying value)  playing,required TResult Function( PlayerError value)  error,}){
final _that = this;
switch (_that) {
case PlayerIdle():
return idle(_that);case PlayerLoading():
return loading(_that);case PlayerPlaying():
return playing(_that);case PlayerError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlayerIdle value)?  idle,TResult? Function( PlayerLoading value)?  loading,TResult? Function( PlayerPlaying value)?  playing,TResult? Function( PlayerError value)?  error,}){
final _that = this;
switch (_that) {
case PlayerIdle() when idle != null:
return idle(_that);case PlayerLoading() when loading != null:
return loading(_that);case PlayerPlaying() when playing != null:
return playing(_that);case PlayerError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( String? title)?  loading,TResult Function( PlaySession session,  String? title,  Duration position,  Duration duration,  Duration buffer,  bool isPlaying,  bool isBuffering,  double playbackSpeed,  List<MediaTrack> audioTracks,  List<MediaTrack> subtitleTracks,  String? selectedAudioTrackId,  String? selectedSubtitleTrackId,  String? videoResolution)?  playing,TResult Function( String message,  String? title)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlayerIdle() when idle != null:
return idle();case PlayerLoading() when loading != null:
return loading(_that.title);case PlayerPlaying() when playing != null:
return playing(_that.session,_that.title,_that.position,_that.duration,_that.buffer,_that.isPlaying,_that.isBuffering,_that.playbackSpeed,_that.audioTracks,_that.subtitleTracks,_that.selectedAudioTrackId,_that.selectedSubtitleTrackId,_that.videoResolution);case PlayerError() when error != null:
return error(_that.message,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( String? title)  loading,required TResult Function( PlaySession session,  String? title,  Duration position,  Duration duration,  Duration buffer,  bool isPlaying,  bool isBuffering,  double playbackSpeed,  List<MediaTrack> audioTracks,  List<MediaTrack> subtitleTracks,  String? selectedAudioTrackId,  String? selectedSubtitleTrackId,  String? videoResolution)  playing,required TResult Function( String message,  String? title)  error,}) {final _that = this;
switch (_that) {
case PlayerIdle():
return idle();case PlayerLoading():
return loading(_that.title);case PlayerPlaying():
return playing(_that.session,_that.title,_that.position,_that.duration,_that.buffer,_that.isPlaying,_that.isBuffering,_that.playbackSpeed,_that.audioTracks,_that.subtitleTracks,_that.selectedAudioTrackId,_that.selectedSubtitleTrackId,_that.videoResolution);case PlayerError():
return error(_that.message,_that.title);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( String? title)?  loading,TResult? Function( PlaySession session,  String? title,  Duration position,  Duration duration,  Duration buffer,  bool isPlaying,  bool isBuffering,  double playbackSpeed,  List<MediaTrack> audioTracks,  List<MediaTrack> subtitleTracks,  String? selectedAudioTrackId,  String? selectedSubtitleTrackId,  String? videoResolution)?  playing,TResult? Function( String message,  String? title)?  error,}) {final _that = this;
switch (_that) {
case PlayerIdle() when idle != null:
return idle();case PlayerLoading() when loading != null:
return loading(_that.title);case PlayerPlaying() when playing != null:
return playing(_that.session,_that.title,_that.position,_that.duration,_that.buffer,_that.isPlaying,_that.isBuffering,_that.playbackSpeed,_that.audioTracks,_that.subtitleTracks,_that.selectedAudioTrackId,_that.selectedSubtitleTrackId,_that.videoResolution);case PlayerError() when error != null:
return error(_that.message,_that.title);case _:
  return null;

}
}

}

/// @nodoc


class PlayerIdle implements PlayerState {
  const PlayerIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerState.idle()';
}


}




/// @nodoc


class PlayerLoading implements PlayerState {
  const PlayerLoading({this.title});
  

 final  String? title;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerLoadingCopyWith<PlayerLoading> get copyWith => _$PlayerLoadingCopyWithImpl<PlayerLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerLoading&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'PlayerState.loading(title: $title)';
}


}

/// @nodoc
abstract mixin class $PlayerLoadingCopyWith<$Res> implements $PlayerStateCopyWith<$Res> {
  factory $PlayerLoadingCopyWith(PlayerLoading value, $Res Function(PlayerLoading) _then) = _$PlayerLoadingCopyWithImpl;
@useResult
$Res call({
 String? title
});




}
/// @nodoc
class _$PlayerLoadingCopyWithImpl<$Res>
    implements $PlayerLoadingCopyWith<$Res> {
  _$PlayerLoadingCopyWithImpl(this._self, this._then);

  final PlayerLoading _self;
  final $Res Function(PlayerLoading) _then;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = freezed,}) {
  return _then(PlayerLoading(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PlayerPlaying implements PlayerState {
  const PlayerPlaying({required this.session, this.title, this.position = Duration.zero, this.duration = Duration.zero, this.buffer = Duration.zero, this.isPlaying = true, this.isBuffering = false, this.playbackSpeed = 1.0, final  List<MediaTrack> audioTracks = const [], final  List<MediaTrack> subtitleTracks = const [], this.selectedAudioTrackId, this.selectedSubtitleTrackId, this.videoResolution}): _audioTracks = audioTracks,_subtitleTracks = subtitleTracks;
  

 final  PlaySession session;
 final  String? title;
@JsonKey() final  Duration position;
@JsonKey() final  Duration duration;
@JsonKey() final  Duration buffer;
@JsonKey() final  bool isPlaying;
@JsonKey() final  bool isBuffering;
@JsonKey() final  double playbackSpeed;
 final  List<MediaTrack> _audioTracks;
@JsonKey() List<MediaTrack> get audioTracks {
  if (_audioTracks is EqualUnmodifiableListView) return _audioTracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_audioTracks);
}

 final  List<MediaTrack> _subtitleTracks;
@JsonKey() List<MediaTrack> get subtitleTracks {
  if (_subtitleTracks is EqualUnmodifiableListView) return _subtitleTracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtitleTracks);
}

 final  String? selectedAudioTrackId;
 final  String? selectedSubtitleTrackId;
 final  String? videoResolution;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerPlayingCopyWith<PlayerPlaying> get copyWith => _$PlayerPlayingCopyWithImpl<PlayerPlaying>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerPlaying&&(identical(other.session, session) || other.session == session)&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.buffer, buffer) || other.buffer == buffer)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering)&&(identical(other.playbackSpeed, playbackSpeed) || other.playbackSpeed == playbackSpeed)&&const DeepCollectionEquality().equals(other._audioTracks, _audioTracks)&&const DeepCollectionEquality().equals(other._subtitleTracks, _subtitleTracks)&&(identical(other.selectedAudioTrackId, selectedAudioTrackId) || other.selectedAudioTrackId == selectedAudioTrackId)&&(identical(other.selectedSubtitleTrackId, selectedSubtitleTrackId) || other.selectedSubtitleTrackId == selectedSubtitleTrackId)&&(identical(other.videoResolution, videoResolution) || other.videoResolution == videoResolution));
}


@override
int get hashCode => Object.hash(runtimeType,session,title,position,duration,buffer,isPlaying,isBuffering,playbackSpeed,const DeepCollectionEquality().hash(_audioTracks),const DeepCollectionEquality().hash(_subtitleTracks),selectedAudioTrackId,selectedSubtitleTrackId,videoResolution);

@override
String toString() {
  return 'PlayerState.playing(session: $session, title: $title, position: $position, duration: $duration, buffer: $buffer, isPlaying: $isPlaying, isBuffering: $isBuffering, playbackSpeed: $playbackSpeed, audioTracks: $audioTracks, subtitleTracks: $subtitleTracks, selectedAudioTrackId: $selectedAudioTrackId, selectedSubtitleTrackId: $selectedSubtitleTrackId, videoResolution: $videoResolution)';
}


}

/// @nodoc
abstract mixin class $PlayerPlayingCopyWith<$Res> implements $PlayerStateCopyWith<$Res> {
  factory $PlayerPlayingCopyWith(PlayerPlaying value, $Res Function(PlayerPlaying) _then) = _$PlayerPlayingCopyWithImpl;
@useResult
$Res call({
 PlaySession session, String? title, Duration position, Duration duration, Duration buffer, bool isPlaying, bool isBuffering, double playbackSpeed, List<MediaTrack> audioTracks, List<MediaTrack> subtitleTracks, String? selectedAudioTrackId, String? selectedSubtitleTrackId, String? videoResolution
});


$PlaySessionCopyWith<$Res> get session;

}
/// @nodoc
class _$PlayerPlayingCopyWithImpl<$Res>
    implements $PlayerPlayingCopyWith<$Res> {
  _$PlayerPlayingCopyWithImpl(this._self, this._then);

  final PlayerPlaying _self;
  final $Res Function(PlayerPlaying) _then;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? title = freezed,Object? position = null,Object? duration = null,Object? buffer = null,Object? isPlaying = null,Object? isBuffering = null,Object? playbackSpeed = null,Object? audioTracks = null,Object? subtitleTracks = null,Object? selectedAudioTrackId = freezed,Object? selectedSubtitleTrackId = freezed,Object? videoResolution = freezed,}) {
  return _then(PlayerPlaying(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as PlaySession,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,buffer: null == buffer ? _self.buffer : buffer // ignore: cast_nullable_to_non_nullable
as Duration,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isBuffering: null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,playbackSpeed: null == playbackSpeed ? _self.playbackSpeed : playbackSpeed // ignore: cast_nullable_to_non_nullable
as double,audioTracks: null == audioTracks ? _self._audioTracks : audioTracks // ignore: cast_nullable_to_non_nullable
as List<MediaTrack>,subtitleTracks: null == subtitleTracks ? _self._subtitleTracks : subtitleTracks // ignore: cast_nullable_to_non_nullable
as List<MediaTrack>,selectedAudioTrackId: freezed == selectedAudioTrackId ? _self.selectedAudioTrackId : selectedAudioTrackId // ignore: cast_nullable_to_non_nullable
as String?,selectedSubtitleTrackId: freezed == selectedSubtitleTrackId ? _self.selectedSubtitleTrackId : selectedSubtitleTrackId // ignore: cast_nullable_to_non_nullable
as String?,videoResolution: freezed == videoResolution ? _self.videoResolution : videoResolution // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaySessionCopyWith<$Res> get session {
  
  return $PlaySessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class PlayerError implements PlayerState {
  const PlayerError({required this.message, this.title});
  

 final  String message;
 final  String? title;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerErrorCopyWith<PlayerError> get copyWith => _$PlayerErrorCopyWithImpl<PlayerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerError&&(identical(other.message, message) || other.message == message)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,message,title);

@override
String toString() {
  return 'PlayerState.error(message: $message, title: $title)';
}


}

/// @nodoc
abstract mixin class $PlayerErrorCopyWith<$Res> implements $PlayerStateCopyWith<$Res> {
  factory $PlayerErrorCopyWith(PlayerError value, $Res Function(PlayerError) _then) = _$PlayerErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? title
});




}
/// @nodoc
class _$PlayerErrorCopyWithImpl<$Res>
    implements $PlayerErrorCopyWith<$Res> {
  _$PlayerErrorCopyWithImpl(this._self, this._then);

  final PlayerError _self;
  final $Res Function(PlayerError) _then;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? title = freezed,}) {
  return _then(PlayerError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
