// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerEvent()';
}


}

/// @nodoc
class $PlayerEventCopyWith<$Res>  {
$PlayerEventCopyWith(PlayerEvent _, $Res Function(PlayerEvent) __);
}


/// Adds pattern-matching-related methods to [PlayerEvent].
extension PlayerEventPatterns on PlayerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlayerStartPlayback value)?  startPlayback,TResult Function( PlayerStopPlayback value)?  stopPlayback,TResult Function( PlayerTogglePlayPause value)?  togglePlayPause,TResult Function( PlayerSeek value)?  seek,TResult Function( PlayerReportError value)?  reportError,TResult Function( PlayerSetPlaybackSpeed value)?  setPlaybackSpeed,TResult Function( PlayerSelectAudioTrack value)?  selectAudioTrack,TResult Function( PlayerSelectSubtitleTrack value)?  selectSubtitleTrack,TResult Function( PlayerUpdatePosition value)?  updatePosition,TResult Function( PlayerUpdateTracks value)?  updateTracks,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlayerStartPlayback() when startPlayback != null:
return startPlayback(_that);case PlayerStopPlayback() when stopPlayback != null:
return stopPlayback(_that);case PlayerTogglePlayPause() when togglePlayPause != null:
return togglePlayPause(_that);case PlayerSeek() when seek != null:
return seek(_that);case PlayerReportError() when reportError != null:
return reportError(_that);case PlayerSetPlaybackSpeed() when setPlaybackSpeed != null:
return setPlaybackSpeed(_that);case PlayerSelectAudioTrack() when selectAudioTrack != null:
return selectAudioTrack(_that);case PlayerSelectSubtitleTrack() when selectSubtitleTrack != null:
return selectSubtitleTrack(_that);case PlayerUpdatePosition() when updatePosition != null:
return updatePosition(_that);case PlayerUpdateTracks() when updateTracks != null:
return updateTracks(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlayerStartPlayback value)  startPlayback,required TResult Function( PlayerStopPlayback value)  stopPlayback,required TResult Function( PlayerTogglePlayPause value)  togglePlayPause,required TResult Function( PlayerSeek value)  seek,required TResult Function( PlayerReportError value)  reportError,required TResult Function( PlayerSetPlaybackSpeed value)  setPlaybackSpeed,required TResult Function( PlayerSelectAudioTrack value)  selectAudioTrack,required TResult Function( PlayerSelectSubtitleTrack value)  selectSubtitleTrack,required TResult Function( PlayerUpdatePosition value)  updatePosition,required TResult Function( PlayerUpdateTracks value)  updateTracks,}){
final _that = this;
switch (_that) {
case PlayerStartPlayback():
return startPlayback(_that);case PlayerStopPlayback():
return stopPlayback(_that);case PlayerTogglePlayPause():
return togglePlayPause(_that);case PlayerSeek():
return seek(_that);case PlayerReportError():
return reportError(_that);case PlayerSetPlaybackSpeed():
return setPlaybackSpeed(_that);case PlayerSelectAudioTrack():
return selectAudioTrack(_that);case PlayerSelectSubtitleTrack():
return selectSubtitleTrack(_that);case PlayerUpdatePosition():
return updatePosition(_that);case PlayerUpdateTracks():
return updateTracks(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlayerStartPlayback value)?  startPlayback,TResult? Function( PlayerStopPlayback value)?  stopPlayback,TResult? Function( PlayerTogglePlayPause value)?  togglePlayPause,TResult? Function( PlayerSeek value)?  seek,TResult? Function( PlayerReportError value)?  reportError,TResult? Function( PlayerSetPlaybackSpeed value)?  setPlaybackSpeed,TResult? Function( PlayerSelectAudioTrack value)?  selectAudioTrack,TResult? Function( PlayerSelectSubtitleTrack value)?  selectSubtitleTrack,TResult? Function( PlayerUpdatePosition value)?  updatePosition,TResult? Function( PlayerUpdateTracks value)?  updateTracks,}){
final _that = this;
switch (_that) {
case PlayerStartPlayback() when startPlayback != null:
return startPlayback(_that);case PlayerStopPlayback() when stopPlayback != null:
return stopPlayback(_that);case PlayerTogglePlayPause() when togglePlayPause != null:
return togglePlayPause(_that);case PlayerSeek() when seek != null:
return seek(_that);case PlayerReportError() when reportError != null:
return reportError(_that);case PlayerSetPlaybackSpeed() when setPlaybackSpeed != null:
return setPlaybackSpeed(_that);case PlayerSelectAudioTrack() when selectAudioTrack != null:
return selectAudioTrack(_that);case PlayerSelectSubtitleTrack() when selectSubtitleTrack != null:
return selectSubtitleTrack(_that);case PlayerUpdatePosition() when updatePosition != null:
return updatePosition(_that);case PlayerUpdateTracks() when updateTracks != null:
return updateTracks(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int streamId,  ContentType type,  String containerExtension,  String? title)?  startPlayback,TResult Function()?  stopPlayback,TResult Function()?  togglePlayPause,TResult Function( Duration position)?  seek,TResult Function( String error)?  reportError,TResult Function( double speed)?  setPlaybackSpeed,TResult Function( String trackId)?  selectAudioTrack,TResult Function( String? trackId)?  selectSubtitleTrack,TResult Function( Duration position,  Duration duration,  Duration buffer,  bool isPlaying,  bool isBuffering)?  updatePosition,TResult Function( List<MediaTrack> audioTracks,  List<MediaTrack> subtitleTracks,  String? videoResolution)?  updateTracks,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlayerStartPlayback() when startPlayback != null:
return startPlayback(_that.streamId,_that.type,_that.containerExtension,_that.title);case PlayerStopPlayback() when stopPlayback != null:
return stopPlayback();case PlayerTogglePlayPause() when togglePlayPause != null:
return togglePlayPause();case PlayerSeek() when seek != null:
return seek(_that.position);case PlayerReportError() when reportError != null:
return reportError(_that.error);case PlayerSetPlaybackSpeed() when setPlaybackSpeed != null:
return setPlaybackSpeed(_that.speed);case PlayerSelectAudioTrack() when selectAudioTrack != null:
return selectAudioTrack(_that.trackId);case PlayerSelectSubtitleTrack() when selectSubtitleTrack != null:
return selectSubtitleTrack(_that.trackId);case PlayerUpdatePosition() when updatePosition != null:
return updatePosition(_that.position,_that.duration,_that.buffer,_that.isPlaying,_that.isBuffering);case PlayerUpdateTracks() when updateTracks != null:
return updateTracks(_that.audioTracks,_that.subtitleTracks,_that.videoResolution);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int streamId,  ContentType type,  String containerExtension,  String? title)  startPlayback,required TResult Function()  stopPlayback,required TResult Function()  togglePlayPause,required TResult Function( Duration position)  seek,required TResult Function( String error)  reportError,required TResult Function( double speed)  setPlaybackSpeed,required TResult Function( String trackId)  selectAudioTrack,required TResult Function( String? trackId)  selectSubtitleTrack,required TResult Function( Duration position,  Duration duration,  Duration buffer,  bool isPlaying,  bool isBuffering)  updatePosition,required TResult Function( List<MediaTrack> audioTracks,  List<MediaTrack> subtitleTracks,  String? videoResolution)  updateTracks,}) {final _that = this;
switch (_that) {
case PlayerStartPlayback():
return startPlayback(_that.streamId,_that.type,_that.containerExtension,_that.title);case PlayerStopPlayback():
return stopPlayback();case PlayerTogglePlayPause():
return togglePlayPause();case PlayerSeek():
return seek(_that.position);case PlayerReportError():
return reportError(_that.error);case PlayerSetPlaybackSpeed():
return setPlaybackSpeed(_that.speed);case PlayerSelectAudioTrack():
return selectAudioTrack(_that.trackId);case PlayerSelectSubtitleTrack():
return selectSubtitleTrack(_that.trackId);case PlayerUpdatePosition():
return updatePosition(_that.position,_that.duration,_that.buffer,_that.isPlaying,_that.isBuffering);case PlayerUpdateTracks():
return updateTracks(_that.audioTracks,_that.subtitleTracks,_that.videoResolution);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int streamId,  ContentType type,  String containerExtension,  String? title)?  startPlayback,TResult? Function()?  stopPlayback,TResult? Function()?  togglePlayPause,TResult? Function( Duration position)?  seek,TResult? Function( String error)?  reportError,TResult? Function( double speed)?  setPlaybackSpeed,TResult? Function( String trackId)?  selectAudioTrack,TResult? Function( String? trackId)?  selectSubtitleTrack,TResult? Function( Duration position,  Duration duration,  Duration buffer,  bool isPlaying,  bool isBuffering)?  updatePosition,TResult? Function( List<MediaTrack> audioTracks,  List<MediaTrack> subtitleTracks,  String? videoResolution)?  updateTracks,}) {final _that = this;
switch (_that) {
case PlayerStartPlayback() when startPlayback != null:
return startPlayback(_that.streamId,_that.type,_that.containerExtension,_that.title);case PlayerStopPlayback() when stopPlayback != null:
return stopPlayback();case PlayerTogglePlayPause() when togglePlayPause != null:
return togglePlayPause();case PlayerSeek() when seek != null:
return seek(_that.position);case PlayerReportError() when reportError != null:
return reportError(_that.error);case PlayerSetPlaybackSpeed() when setPlaybackSpeed != null:
return setPlaybackSpeed(_that.speed);case PlayerSelectAudioTrack() when selectAudioTrack != null:
return selectAudioTrack(_that.trackId);case PlayerSelectSubtitleTrack() when selectSubtitleTrack != null:
return selectSubtitleTrack(_that.trackId);case PlayerUpdatePosition() when updatePosition != null:
return updatePosition(_that.position,_that.duration,_that.buffer,_that.isPlaying,_that.isBuffering);case PlayerUpdateTracks() when updateTracks != null:
return updateTracks(_that.audioTracks,_that.subtitleTracks,_that.videoResolution);case _:
  return null;

}
}

}

/// @nodoc


class PlayerStartPlayback implements PlayerEvent {
  const PlayerStartPlayback({required this.streamId, required this.type, this.containerExtension = 'm3u8', this.title});
  

 final  int streamId;
 final  ContentType type;
@JsonKey() final  String containerExtension;
 final  String? title;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerStartPlaybackCopyWith<PlayerStartPlayback> get copyWith => _$PlayerStartPlaybackCopyWithImpl<PlayerStartPlayback>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerStartPlayback&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.type, type) || other.type == type)&&(identical(other.containerExtension, containerExtension) || other.containerExtension == containerExtension)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,streamId,type,containerExtension,title);

@override
String toString() {
  return 'PlayerEvent.startPlayback(streamId: $streamId, type: $type, containerExtension: $containerExtension, title: $title)';
}


}

/// @nodoc
abstract mixin class $PlayerStartPlaybackCopyWith<$Res> implements $PlayerEventCopyWith<$Res> {
  factory $PlayerStartPlaybackCopyWith(PlayerStartPlayback value, $Res Function(PlayerStartPlayback) _then) = _$PlayerStartPlaybackCopyWithImpl;
@useResult
$Res call({
 int streamId, ContentType type, String containerExtension, String? title
});




}
/// @nodoc
class _$PlayerStartPlaybackCopyWithImpl<$Res>
    implements $PlayerStartPlaybackCopyWith<$Res> {
  _$PlayerStartPlaybackCopyWithImpl(this._self, this._then);

  final PlayerStartPlayback _self;
  final $Res Function(PlayerStartPlayback) _then;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? type = null,Object? containerExtension = null,Object? title = freezed,}) {
  return _then(PlayerStartPlayback(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ContentType,containerExtension: null == containerExtension ? _self.containerExtension : containerExtension // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PlayerStopPlayback implements PlayerEvent {
  const PlayerStopPlayback();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerStopPlayback);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerEvent.stopPlayback()';
}


}




/// @nodoc


class PlayerTogglePlayPause implements PlayerEvent {
  const PlayerTogglePlayPause();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerTogglePlayPause);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerEvent.togglePlayPause()';
}


}




/// @nodoc


class PlayerSeek implements PlayerEvent {
  const PlayerSeek({required this.position});
  

 final  Duration position;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerSeekCopyWith<PlayerSeek> get copyWith => _$PlayerSeekCopyWithImpl<PlayerSeek>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerSeek&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,position);

@override
String toString() {
  return 'PlayerEvent.seek(position: $position)';
}


}

/// @nodoc
abstract mixin class $PlayerSeekCopyWith<$Res> implements $PlayerEventCopyWith<$Res> {
  factory $PlayerSeekCopyWith(PlayerSeek value, $Res Function(PlayerSeek) _then) = _$PlayerSeekCopyWithImpl;
@useResult
$Res call({
 Duration position
});




}
/// @nodoc
class _$PlayerSeekCopyWithImpl<$Res>
    implements $PlayerSeekCopyWith<$Res> {
  _$PlayerSeekCopyWithImpl(this._self, this._then);

  final PlayerSeek _self;
  final $Res Function(PlayerSeek) _then;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,}) {
  return _then(PlayerSeek(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class PlayerReportError implements PlayerEvent {
  const PlayerReportError({required this.error});
  

 final  String error;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerReportErrorCopyWith<PlayerReportError> get copyWith => _$PlayerReportErrorCopyWithImpl<PlayerReportError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerReportError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PlayerEvent.reportError(error: $error)';
}


}

/// @nodoc
abstract mixin class $PlayerReportErrorCopyWith<$Res> implements $PlayerEventCopyWith<$Res> {
  factory $PlayerReportErrorCopyWith(PlayerReportError value, $Res Function(PlayerReportError) _then) = _$PlayerReportErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PlayerReportErrorCopyWithImpl<$Res>
    implements $PlayerReportErrorCopyWith<$Res> {
  _$PlayerReportErrorCopyWithImpl(this._self, this._then);

  final PlayerReportError _self;
  final $Res Function(PlayerReportError) _then;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PlayerReportError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PlayerSetPlaybackSpeed implements PlayerEvent {
  const PlayerSetPlaybackSpeed({required this.speed});
  

 final  double speed;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerSetPlaybackSpeedCopyWith<PlayerSetPlaybackSpeed> get copyWith => _$PlayerSetPlaybackSpeedCopyWithImpl<PlayerSetPlaybackSpeed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerSetPlaybackSpeed&&(identical(other.speed, speed) || other.speed == speed));
}


@override
int get hashCode => Object.hash(runtimeType,speed);

@override
String toString() {
  return 'PlayerEvent.setPlaybackSpeed(speed: $speed)';
}


}

/// @nodoc
abstract mixin class $PlayerSetPlaybackSpeedCopyWith<$Res> implements $PlayerEventCopyWith<$Res> {
  factory $PlayerSetPlaybackSpeedCopyWith(PlayerSetPlaybackSpeed value, $Res Function(PlayerSetPlaybackSpeed) _then) = _$PlayerSetPlaybackSpeedCopyWithImpl;
@useResult
$Res call({
 double speed
});




}
/// @nodoc
class _$PlayerSetPlaybackSpeedCopyWithImpl<$Res>
    implements $PlayerSetPlaybackSpeedCopyWith<$Res> {
  _$PlayerSetPlaybackSpeedCopyWithImpl(this._self, this._then);

  final PlayerSetPlaybackSpeed _self;
  final $Res Function(PlayerSetPlaybackSpeed) _then;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? speed = null,}) {
  return _then(PlayerSetPlaybackSpeed(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class PlayerSelectAudioTrack implements PlayerEvent {
  const PlayerSelectAudioTrack({required this.trackId});
  

 final  String trackId;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerSelectAudioTrackCopyWith<PlayerSelectAudioTrack> get copyWith => _$PlayerSelectAudioTrackCopyWithImpl<PlayerSelectAudioTrack>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerSelectAudioTrack&&(identical(other.trackId, trackId) || other.trackId == trackId));
}


@override
int get hashCode => Object.hash(runtimeType,trackId);

@override
String toString() {
  return 'PlayerEvent.selectAudioTrack(trackId: $trackId)';
}


}

/// @nodoc
abstract mixin class $PlayerSelectAudioTrackCopyWith<$Res> implements $PlayerEventCopyWith<$Res> {
  factory $PlayerSelectAudioTrackCopyWith(PlayerSelectAudioTrack value, $Res Function(PlayerSelectAudioTrack) _then) = _$PlayerSelectAudioTrackCopyWithImpl;
@useResult
$Res call({
 String trackId
});




}
/// @nodoc
class _$PlayerSelectAudioTrackCopyWithImpl<$Res>
    implements $PlayerSelectAudioTrackCopyWith<$Res> {
  _$PlayerSelectAudioTrackCopyWithImpl(this._self, this._then);

  final PlayerSelectAudioTrack _self;
  final $Res Function(PlayerSelectAudioTrack) _then;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trackId = null,}) {
  return _then(PlayerSelectAudioTrack(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PlayerSelectSubtitleTrack implements PlayerEvent {
  const PlayerSelectSubtitleTrack({this.trackId});
  

 final  String? trackId;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerSelectSubtitleTrackCopyWith<PlayerSelectSubtitleTrack> get copyWith => _$PlayerSelectSubtitleTrackCopyWithImpl<PlayerSelectSubtitleTrack>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerSelectSubtitleTrack&&(identical(other.trackId, trackId) || other.trackId == trackId));
}


@override
int get hashCode => Object.hash(runtimeType,trackId);

@override
String toString() {
  return 'PlayerEvent.selectSubtitleTrack(trackId: $trackId)';
}


}

/// @nodoc
abstract mixin class $PlayerSelectSubtitleTrackCopyWith<$Res> implements $PlayerEventCopyWith<$Res> {
  factory $PlayerSelectSubtitleTrackCopyWith(PlayerSelectSubtitleTrack value, $Res Function(PlayerSelectSubtitleTrack) _then) = _$PlayerSelectSubtitleTrackCopyWithImpl;
@useResult
$Res call({
 String? trackId
});




}
/// @nodoc
class _$PlayerSelectSubtitleTrackCopyWithImpl<$Res>
    implements $PlayerSelectSubtitleTrackCopyWith<$Res> {
  _$PlayerSelectSubtitleTrackCopyWithImpl(this._self, this._then);

  final PlayerSelectSubtitleTrack _self;
  final $Res Function(PlayerSelectSubtitleTrack) _then;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trackId = freezed,}) {
  return _then(PlayerSelectSubtitleTrack(
trackId: freezed == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PlayerUpdatePosition implements PlayerEvent {
  const PlayerUpdatePosition({required this.position, required this.duration, required this.buffer, required this.isPlaying, required this.isBuffering});
  

 final  Duration position;
 final  Duration duration;
 final  Duration buffer;
 final  bool isPlaying;
 final  bool isBuffering;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerUpdatePositionCopyWith<PlayerUpdatePosition> get copyWith => _$PlayerUpdatePositionCopyWithImpl<PlayerUpdatePosition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerUpdatePosition&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.buffer, buffer) || other.buffer == buffer)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering));
}


@override
int get hashCode => Object.hash(runtimeType,position,duration,buffer,isPlaying,isBuffering);

@override
String toString() {
  return 'PlayerEvent.updatePosition(position: $position, duration: $duration, buffer: $buffer, isPlaying: $isPlaying, isBuffering: $isBuffering)';
}


}

/// @nodoc
abstract mixin class $PlayerUpdatePositionCopyWith<$Res> implements $PlayerEventCopyWith<$Res> {
  factory $PlayerUpdatePositionCopyWith(PlayerUpdatePosition value, $Res Function(PlayerUpdatePosition) _then) = _$PlayerUpdatePositionCopyWithImpl;
@useResult
$Res call({
 Duration position, Duration duration, Duration buffer, bool isPlaying, bool isBuffering
});




}
/// @nodoc
class _$PlayerUpdatePositionCopyWithImpl<$Res>
    implements $PlayerUpdatePositionCopyWith<$Res> {
  _$PlayerUpdatePositionCopyWithImpl(this._self, this._then);

  final PlayerUpdatePosition _self;
  final $Res Function(PlayerUpdatePosition) _then;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,Object? duration = null,Object? buffer = null,Object? isPlaying = null,Object? isBuffering = null,}) {
  return _then(PlayerUpdatePosition(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,buffer: null == buffer ? _self.buffer : buffer // ignore: cast_nullable_to_non_nullable
as Duration,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isBuffering: null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class PlayerUpdateTracks implements PlayerEvent {
  const PlayerUpdateTracks({final  List<MediaTrack> audioTracks = const [], final  List<MediaTrack> subtitleTracks = const [], this.videoResolution}): _audioTracks = audioTracks,_subtitleTracks = subtitleTracks;
  

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

 final  String? videoResolution;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerUpdateTracksCopyWith<PlayerUpdateTracks> get copyWith => _$PlayerUpdateTracksCopyWithImpl<PlayerUpdateTracks>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerUpdateTracks&&const DeepCollectionEquality().equals(other._audioTracks, _audioTracks)&&const DeepCollectionEquality().equals(other._subtitleTracks, _subtitleTracks)&&(identical(other.videoResolution, videoResolution) || other.videoResolution == videoResolution));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_audioTracks),const DeepCollectionEquality().hash(_subtitleTracks),videoResolution);

@override
String toString() {
  return 'PlayerEvent.updateTracks(audioTracks: $audioTracks, subtitleTracks: $subtitleTracks, videoResolution: $videoResolution)';
}


}

/// @nodoc
abstract mixin class $PlayerUpdateTracksCopyWith<$Res> implements $PlayerEventCopyWith<$Res> {
  factory $PlayerUpdateTracksCopyWith(PlayerUpdateTracks value, $Res Function(PlayerUpdateTracks) _then) = _$PlayerUpdateTracksCopyWithImpl;
@useResult
$Res call({
 List<MediaTrack> audioTracks, List<MediaTrack> subtitleTracks, String? videoResolution
});




}
/// @nodoc
class _$PlayerUpdateTracksCopyWithImpl<$Res>
    implements $PlayerUpdateTracksCopyWith<$Res> {
  _$PlayerUpdateTracksCopyWithImpl(this._self, this._then);

  final PlayerUpdateTracks _self;
  final $Res Function(PlayerUpdateTracks) _then;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? audioTracks = null,Object? subtitleTracks = null,Object? videoResolution = freezed,}) {
  return _then(PlayerUpdateTracks(
audioTracks: null == audioTracks ? _self._audioTracks : audioTracks // ignore: cast_nullable_to_non_nullable
as List<MediaTrack>,subtitleTracks: null == subtitleTracks ? _self._subtitleTracks : subtitleTracks // ignore: cast_nullable_to_non_nullable
as List<MediaTrack>,videoResolution: freezed == videoResolution ? _self.videoResolution : videoResolution // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
