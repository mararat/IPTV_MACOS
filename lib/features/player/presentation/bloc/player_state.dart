import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iptv_macos/features/player/domain/entities/play_session.dart';

part 'player_state.freezed.dart';

@freezed
abstract class MediaTrack with _$MediaTrack {
  const factory MediaTrack({
    required String id,
    required String title,
    @Default('') String language,
  }) = _MediaTrack;
}

@freezed
sealed class PlayerState with _$PlayerState {
  const factory PlayerState.idle() = PlayerIdle;
  const factory PlayerState.loading({String? title}) = PlayerLoading;
  const factory PlayerState.playing({
    required PlaySession session,
    String? title,
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration duration,
    @Default(Duration.zero) Duration buffer,
    @Default(true) bool isPlaying,
    @Default(false) bool isBuffering,
    @Default(1.0) double playbackSpeed,
    @Default([]) List<MediaTrack> audioTracks,
    @Default([]) List<MediaTrack> subtitleTracks,
    String? selectedAudioTrackId,
    String? selectedSubtitleTrackId,
    String? videoResolution,
  }) = PlayerPlaying;
  const factory PlayerState.error({
    required String message,
    String? title,
  }) = PlayerError;
}
