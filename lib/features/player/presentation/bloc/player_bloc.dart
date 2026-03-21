import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/logging/analytics_service.dart';
import 'package:iptv_macos/features/player/domain/usecases/get_play_session_usecase.dart';
import 'package:iptv_macos/features/player/presentation/bloc/player_event.dart';
import 'package:iptv_macos/features/player/presentation/bloc/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc(this._getPlaySessionUseCase, this._analyticsService)
      : super(const PlayerState.idle()) {
    on<PlayerStartPlayback>(_onStart);
    on<PlayerStopPlayback>(_onStop);
    on<PlayerReportError>(_onReportError);
    on<PlayerSetPlaybackSpeed>(_onSetPlaybackSpeed);
    on<PlayerSelectAudioTrack>(_onSelectAudioTrack);
    on<PlayerSelectSubtitleTrack>(_onSelectSubtitleTrack);
    on<PlayerUpdatePosition>(_onUpdatePosition);
    on<PlayerUpdateTracks>(_onUpdateTracks);
  }

  final GetPlaySessionUseCase _getPlaySessionUseCase;
  final AnalyticsService _analyticsService;
  DateTime? _playStartTime;

  Future<void> _onStart(
    PlayerStartPlayback event,
    Emitter<PlayerState> emit,
  ) async {
    emit(PlayerState.loading(title: event.title));
    _playStartTime = DateTime.now();

    final result = await _getPlaySessionUseCase(PlaySessionParams(
      streamId: event.streamId,
      type: event.type,
      containerExtension: event.containerExtension,
    ));

    result.fold(
      (failure) {
        _analyticsService.logEvent(AnalyticsEvent.playError, {
          'streamId': event.streamId,
          'error': failure.message,
        });
        emit(PlayerState.error(message: failure.message, title: event.title));
      },
      (session) {
        final zapTime =
            DateTime.now().difference(_playStartTime!).inMilliseconds;
        _analyticsService.logEvent(AnalyticsEvent.playStart, {
          'streamId': event.streamId,
          'type': event.type.name,
        });
        _analyticsService.logEvent(AnalyticsEvent.zapTime, {
          'streamId': event.streamId,
          'zapTimeMs': zapTime,
        });
        emit(PlayerState.playing(session: session, title: event.title));
      },
    );
  }

  Future<void> _onStop(
    PlayerStopPlayback event,
    Emitter<PlayerState> emit,
  ) async {
    if (state is PlayerPlaying) {
      _analyticsService.logEvent(AnalyticsEvent.playStop);
    }
    _playStartTime = null;
    emit(const PlayerState.idle());
  }

  void _onReportError(
    PlayerReportError event,
    Emitter<PlayerState> emit,
  ) {
    _analyticsService.logEvent(AnalyticsEvent.playError, {
      'error': event.error,
    });
  }

  void _onSetPlaybackSpeed(
    PlayerSetPlaybackSpeed event,
    Emitter<PlayerState> emit,
  ) {
    final s = state;
    if (s is PlayerPlaying) {
      emit(s.copyWith(playbackSpeed: event.speed));
    }
  }

  void _onSelectAudioTrack(
    PlayerSelectAudioTrack event,
    Emitter<PlayerState> emit,
  ) {
    final s = state;
    if (s is PlayerPlaying) {
      emit(s.copyWith(selectedAudioTrackId: event.trackId));
    }
  }

  void _onSelectSubtitleTrack(
    PlayerSelectSubtitleTrack event,
    Emitter<PlayerState> emit,
  ) {
    final s = state;
    if (s is PlayerPlaying) {
      emit(s.copyWith(selectedSubtitleTrackId: event.trackId));
    }
  }

  void _onUpdatePosition(
    PlayerUpdatePosition event,
    Emitter<PlayerState> emit,
  ) {
    final s = state;
    if (s is PlayerPlaying) {
      emit(s.copyWith(
        position: event.position,
        duration: event.duration,
        buffer: event.buffer,
        isPlaying: event.isPlaying,
        isBuffering: event.isBuffering,
      ));
    }
  }

  void _onUpdateTracks(
    PlayerUpdateTracks event,
    Emitter<PlayerState> emit,
  ) {
    final s = state;
    if (s is PlayerPlaying) {
      emit(s.copyWith(
        audioTracks: event.audioTracks,
        subtitleTracks: event.subtitleTracks,
        videoResolution: event.videoResolution,
      ));
    }
  }
}
