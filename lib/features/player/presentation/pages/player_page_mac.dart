import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart' hide PlayerState;
import 'package:media_kit_video/media_kit_video.dart';
import 'package:iptv_macos/core/theme/app_colors.dart';
import 'package:iptv_macos/features/player/domain/entities/content_type.dart';
import 'package:iptv_macos/features/player/presentation/bloc/player_bloc.dart';
import 'package:iptv_macos/features/player/presentation/bloc/player_event.dart';
import 'package:iptv_macos/features/player/presentation/bloc/player_state.dart';

class PlayerPageMac extends StatefulWidget {
  const PlayerPageMac({super.key, required this.streamId, required this.contentType, this.containerExtension = 'm3u8', this.title, this.onBack});
  final int streamId; final String contentType; final String containerExtension; final String? title; final VoidCallback? onBack;
  @override
  State<PlayerPageMac> createState() => _PlayerPageMacState();
}

class _PlayerPageMacState extends State<PlayerPageMac> {
  Player? _player;
  VideoController? _videoController;
  bool _showControls = true;
  Timer? _hideTimer;
  double _volume = 100.0;
  bool _isMuted = false;
  double _playbackSpeed = 1.0;
  final List<StreamSubscription<dynamic>> _subscriptions = [];
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  Duration _buffer = Duration.zero;
  bool _isPlaying = false;
  bool _isBuffering = false;
  List<AudioTrack> _audioTracks = [];
  List<SubtitleTrack> _subtitleTracks = [];
  final FocusNode _focusNode = FocusNode();

  static const _speeds = [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0];

  bool get _isLive => widget.contentType == 'live';

  @override
  void initState() {
    super.initState();
    ContentType type;
    switch (widget.contentType) {
      case 'vod': type = ContentType.vod; break;
      case 'series': type = ContentType.series; break;
      default: type = ContentType.live;
    }
    context.read<PlayerBloc>().add(PlayerEvent.startPlayback(streamId: widget.streamId, type: type, containerExtension: widget.containerExtension, title: widget.title));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _hideTimer?.cancel();
    for (final sub in _subscriptions) { sub.cancel(); }
    _player?.dispose();
    super.dispose();
  }

  void _initializePlayer(String url, Map<String, String> headers) {
    _player?.dispose();
    for (final sub in _subscriptions) { sub.cancel(); }
    _subscriptions.clear();

    _player = Player(configuration: const PlayerConfiguration(bufferSize: 32 * 1024 * 1024, logLevel: MPVLogLevel.warn));
    _videoController = VideoController(_player!);

    _subscriptions.add(_player!.stream.position.listen((pos) {
      if (!mounted) return;
      setState(() { _position = pos; _duration = _player!.state.duration; _buffer = _player!.state.buffer; _isPlaying = _player!.state.playing; _isBuffering = _player!.state.buffering; });
    }));

    _subscriptions.add(_player!.stream.playing.listen((playing) {
      if (!mounted) return;
      setState(() => _isPlaying = playing);
    }));

    _subscriptions.add(_player!.stream.buffering.listen((buffering) {
      if (!mounted) return;
      setState(() => _isBuffering = buffering);
    }));

    _subscriptions.add(_player!.stream.tracks.listen((t) {
      if (!mounted) return;
      setState(() {
        _audioTracks = t.audio.where((a) => a.id != 'auto' && a.id != 'no').toList();
        _subtitleTracks = t.subtitle.where((s) => s.id != 'auto' && s.id != 'no').toList();
      });
    }));

    _player!.open(Media(url, httpHeaders: headers));
    _player!.setVolume(_volume);
    _startHideTimer();
    setState(() {});
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () { if (mounted) setState(() => _showControls = false); });
  }

  void _onMouseMove() {
    if (!_showControls) setState(() => _showControls = true);
    _startHideTimer();
  }

  void _toggleMute() {
    setState(() => _isMuted = !_isMuted);
    _player?.setVolume(_isMuted ? 0 : _volume);
  }

  void _seekRelative(int seconds) {
    if (_isLive) return;
    final target = _position + Duration(seconds: seconds);
    if (seconds < 0) {
      _player?.seek(target < Duration.zero ? Duration.zero : target);
    } else {
      _player?.seek(_duration > Duration.zero && target > _duration ? _duration : target);
    }
  }

  void _cycleSpeed(int direction) {
    if (_isLive) return;
    final idx = _speeds.indexOf(_playbackSpeed);
    final next = (idx + direction).clamp(0, _speeds.length - 1);
    setState(() => _playbackSpeed = _speeds[next]);
    _player?.setRate(_playbackSpeed);
  }

  void _changeVolume(double delta) {
    final v = (_volume + delta).clamp(0.0, 100.0);
    setState(() { _volume = v; _isMuted = false; });
    _player?.setVolume(v);
  }

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) return KeyEventResult.ignored;
    final key = event.logicalKey;

    if (key == LogicalKeyboardKey.space) {
      _player?.playOrPause();
      _onMouseMove();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowLeft) {
      _seekRelative(-10);
      _onMouseMove();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowRight) {
      _seekRelative(10);
      _onMouseMove();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowUp) {
      _changeVolume(5);
      _onMouseMove();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowDown) {
      _changeVolume(-5);
      _onMouseMove();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.keyM) {
      _toggleMute();
      _onMouseMove();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.escape) {
      widget.onBack?.call();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.bracketRight) {
      _cycleSpeed(1);
      _onMouseMove();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.bracketLeft) {
      _cycleSpeed(-1);
      _onMouseMove();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  String _fmt(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return h > 0 ? '$h:$m:$s' : '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlayerBloc, PlayerState>(
      listener: (context, state) {
        if (state is PlayerPlaying && _player == null) {
          _initializePlayer(state.session.playUrl, state.session.headers);
        }
      },
      listenWhen: (prev, curr) => prev is! PlayerPlaying && curr is PlayerPlaying,
      child: Focus(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: _handleKey,
        child: Container(
          color: Colors.black,
          child: MouseRegion(
            onHover: (_) => _onMouseMove(),
            child: GestureDetector(
              onTap: () {
                _focusNode.requestFocus();
                setState(() => _showControls = !_showControls);
                if (_showControls) _startHideTimer();
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Video
                  if (_videoController != null)
                    SizedBox.expand(child: Video(controller: _videoController!, controls: (_) => const SizedBox.shrink()))
                  else
                    const Center(child: CircularProgressIndicator(color: Colors.white)),

                  // Buffering
                  if (_isBuffering) const Center(child: CircularProgressIndicator(color: Colors.white70)),

                  // Controls overlay
                  IgnorePointer(
                    ignoring: !_showControls,
                    child: AnimatedOpacity(
                      opacity: _showControls ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 250),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [0.0, 0.15, 0.85, 1.0], colors: [Colors.black87, Colors.transparent, Colors.transparent, Colors.black87]),
                        ),
                        child: Column(
                          children: [
                            // Top bar
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Row(
                                children: [
                                  IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: widget.onBack),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(widget.title ?? '', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                  // Audio tracks
                                  if (_audioTracks.length > 1)
                                    PopupMenuButton<AudioTrack>(
                                      tooltip: 'Ses Dili',
                                      icon: const Icon(Icons.audiotrack, color: Colors.white70, size: 22),
                                      offset: const Offset(0, 40),
                                      itemBuilder: (_) => _audioTracks.map((t) => PopupMenuItem(value: t, child: Text(t.title ?? t.language ?? t.id, style: const TextStyle(fontSize: 12)))).toList(),
                                      onSelected: (t) => _player?.setAudioTrack(t),
                                    ),
                                  // Subtitle tracks
                                  if (_subtitleTracks.isNotEmpty)
                                    PopupMenuButton<SubtitleTrack?>(
                                      tooltip: 'Altyazi',
                                      icon: const Icon(Icons.closed_caption, color: Colors.white70, size: 22),
                                      offset: const Offset(0, 40),
                                      itemBuilder: (_) => [
                                        const PopupMenuItem(value: null, child: Text('Kapali', style: TextStyle(fontSize: 12))),
                                        ..._subtitleTracks.map((t) => PopupMenuItem(value: t, child: Text(t.title ?? t.language ?? t.id, style: const TextStyle(fontSize: 12)))),
                                      ],
                                      onSelected: (t) => t == null ? _player?.setSubtitleTrack(SubtitleTrack.no()) : _player?.setSubtitleTrack(t),
                                    ),
                                ],
                              ),
                            ),
                            // Center play button
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (!_isLive) IconButton(iconSize: 36, icon: const Icon(Icons.replay_10, color: Colors.white), onPressed: () => _seekRelative(-10)),
                                const SizedBox(width: 20),
                                IconButton(iconSize: 52, icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled, color: Colors.white), onPressed: () => _player?.playOrPause()),
                                const SizedBox(width: 20),
                                if (!_isLive) IconButton(iconSize: 36, icon: const Icon(Icons.forward_10, color: Colors.white), onPressed: () => _seekRelative(10)),
                              ],
                            ),
                            const Spacer(),
                            // Bottom bar
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                              child: Column(
                                children: [
                                  if (!_isLive && _duration > Duration.zero)
                                    Row(
                                      children: [
                                        Text(_fmt(_position), style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: SliderTheme(
                                            data: SliderThemeData(trackHeight: 3, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6), activeTrackColor: Colors.white, inactiveTrackColor: Colors.white24, thumbColor: Colors.white, secondaryActiveTrackColor: Colors.white38),
                                            child: Slider(
                                              value: _position.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()),
                                              max: _duration.inMilliseconds.toDouble(),
                                              secondaryTrackValue: _buffer.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()),
                                              onChanged: (v) => _player?.seek(Duration(milliseconds: v.toInt())),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(_fmt(_duration), style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                      ],
                                    ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white70, size: 20),
                                        onPressed: _toggleMute,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: SliderTheme(
                                          data: const SliderThemeData(trackHeight: 2, thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5), activeTrackColor: Colors.white70, inactiveTrackColor: Colors.white24, thumbColor: Colors.white),
                                          child: Slider(value: _isMuted ? 0 : _volume, max: 100, onChanged: (v) { setState(() { _volume = v; _isMuted = false; }); _player?.setVolume(v); }),
                                        ),
                                      ),
                                      const Spacer(),
                                      // Playback speed (VOD/series only)
                                      if (!_isLive)
                                        PopupMenuButton<double>(
                                          tooltip: 'Hiz',
                                          offset: const Offset(0, -280),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: _playbackSpeed != 1.0 ? Colors.white24 : Colors.transparent,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Text('${_playbackSpeed}x', style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600)),
                                          ),
                                          itemBuilder: (_) => _speeds.map((s) => PopupMenuItem(
                                            value: s,
                                            child: Row(children: [
                                              if (s == _playbackSpeed) const Icon(Icons.check, size: 16, color: Colors.white) else const SizedBox(width: 16),
                                              const SizedBox(width: 8),
                                              Text('${s}x', style: const TextStyle(fontSize: 13)),
                                            ]),
                                          )).toList(),
                                          onSelected: (s) {
                                            setState(() => _playbackSpeed = s);
                                            _player?.setRate(s);
                                          },
                                        ),
                                      const SizedBox(width: 8),
                                      if (_isLive)
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(color: AppColors.live, borderRadius: BorderRadius.circular(4)),
                                          child: const Text('CANLI', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
