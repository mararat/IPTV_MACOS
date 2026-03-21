import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iptv_macos/features/player/domain/entities/content_type.dart';
import 'package:iptv_macos/features/player/presentation/bloc/player_state.dart';

part 'player_event.freezed.dart';

@freezed
sealed class PlayerEvent with _$PlayerEvent {
  const factory PlayerEvent.startPlayback({
    required int streamId,
    required ContentType type,
    @Default('m3u8') String containerExtension,
    String? title,
  }) = PlayerStartPlayback;
  const factory PlayerEvent.stopPlayback() = PlayerStopPlayback;
  const factory PlayerEvent.togglePlayPause() = PlayerTogglePlayPause;
  const factory PlayerEvent.seek({required Duration position}) = PlayerSeek;
  const factory PlayerEvent.reportError({required String error}) =
      PlayerReportError;
  const factory PlayerEvent.setPlaybackSpeed({required double speed}) =
      PlayerSetPlaybackSpeed;
  const factory PlayerEvent.selectAudioTrack({required String trackId}) =
      PlayerSelectAudioTrack;
  const factory PlayerEvent.selectSubtitleTrack({String? trackId}) =
      PlayerSelectSubtitleTrack;
  const factory PlayerEvent.updatePosition({
    required Duration position,
    required Duration duration,
    required Duration buffer,
    required bool isPlaying,
    required bool isBuffering,
  }) = PlayerUpdatePosition;
  const factory PlayerEvent.updateTracks({
    @Default([]) List<MediaTrack> audioTracks,
    @Default([]) List<MediaTrack> subtitleTracks,
    String? videoResolution,
  }) = PlayerUpdateTracks;
}
