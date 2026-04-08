import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_kit/media_kit.dart' as mk;
import 'package:media_kit_video/media_kit_video.dart';

/// Shared inline video player with controls overlay.
///
/// Manages its own Player lifecycle, stream subscriptions, and control visibility.
/// Used by Live TV, VOD, and Series pages.
class InlinePlayer extends StatefulWidget {
  const InlinePlayer({
    super.key,
    required this.url,
    this.title,
    this.isLive = false,
    this.onClose,
    this.onFullscreen,
    this.topExtra,
    this.bufferSize = 64 * 1024 * 1024,
  });

  final String url;
  final String? title;
  final bool isLive;
  final VoidCallback? onClose;
  final VoidCallback? onFullscreen;
  final Widget? topExtra;
  final int bufferSize;

  @override
  State<InlinePlayer> createState() => InlinePlayerState();
}

class InlinePlayerState extends State<InlinePlayer> {
  mk.Player? _player;
  VideoController? _videoController;
  bool _showControls = true;
  Timer? _hideTimer;
  double _volume = 100;
  bool _isMuted = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  Duration _buffer = Duration.zero;
  bool _isPlaying = false;
  bool _isBuffering = false;
  double _playbackSpeed = 1.0;
  List<mk.AudioTrack> _audioTracks = [];
  List<mk.SubtitleTrack> _subtitleTracks = [];
  final List<StreamSubscription<dynamic>> _subs = [];
  final FocusNode _focusNode = FocusNode();

  static const _speeds = [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0];

  VideoController? get videoController => _videoController;
  mk.Player? get player => _player;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  @override
  void didUpdateWidget(InlinePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _disposePlayer();
      _initPlayer();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _disposePlayer();
    super.dispose();
  }

  void _initPlayer() {
    _player = mk.Player(configuration: mk.PlayerConfiguration(bufferSize: widget.bufferSize, logLevel: mk.MPVLogLevel.warn));
    _videoController = VideoController(_player!);

    _subs.add(_player!.stream.position.listen((p) { if (mounted) setState(() => _position = p); }));
    _subs.add(_player!.stream.duration.listen((d) { if (mounted) setState(() => _duration = d); }));
    _subs.add(_player!.stream.buffer.listen((b) { if (mounted) setState(() => _buffer = b); }));
    _subs.add(_player!.stream.playing.listen((p) { if (mounted) setState(() => _isPlaying = p); }));
    _subs.add(_player!.stream.buffering.listen((b) { if (mounted) setState(() => _isBuffering = b); }));
    _subs.add(_player!.stream.tracks.listen((t) {
      if (mounted) {
        setState(() {
          _audioTracks = t.audio.where((a) => a.id != 'auto' && a.id != 'no').toList();
          _subtitleTracks = t.subtitle.where((s) => s.id != 'auto' && s.id != 'no').toList();
        });
      }
    }));

    _player!.open(mk.Media(widget.url));
    _player!.setVolume(_volume);
    _startHideTimer();
  }

  void _disposePlayer() {
    _hideTimer?.cancel();
    for (final s in _subs) { s.cancel(); }
    _subs.clear();
    _player?.dispose();
    _player = null;
    _videoController = null;
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) setState(() => _showControls = false);
    });
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
    if (widget.isLive) return;
    final target = _position + Duration(seconds: seconds);
    if (seconds < 0) {
      _player?.seek(target < Duration.zero ? Duration.zero : target);
    } else {
      _player?.seek(_duration > Duration.zero && target > _duration ? _duration : target);
    }
  }

  void _cycleSpeed(int direction) {
    if (widget.isLive) return;
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
    if (key == LogicalKeyboardKey.keyF) {
      widget.onFullscreen?.call();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.escape) {
      widget.onClose?.call();
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
    final cs = Theme.of(context).colorScheme;

    if (_videoController == null) {
      return const Center(child: CircularProgressIndicator(color: Colors.white70));
    }

    return Focus(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: _handleKey,
      child: MouseRegion(
        onHover: (_) => _onMouseMove(),
        child: GestureDetector(
          onDoubleTap: widget.onFullscreen,
          onTap: () {
            _focusNode.requestFocus();
            setState(() => _showControls = !_showControls);
            if (_showControls) _startHideTimer();
          },
          child: Container(
            color: Colors.black,
            child: Stack(
              fit: StackFit.expand,
              children: [
                SizedBox.expand(child: Video(controller: _videoController!, controls: (_) => const SizedBox.shrink())),
                if (_isBuffering) const Center(child: CircularProgressIndicator(color: Colors.white70, strokeWidth: 3)),

                // Top overlay
                Positioned(
                  top: 0, left: 0, right: 0,
                  child: IgnorePointer(
                    ignoring: !_showControls,
                    child: AnimatedOpacity(
                      opacity: _showControls ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black87, Colors.transparent])),
                        child: Row(children: [
                          if (widget.topExtra != null) ...[widget.topExtra!, const SizedBox(width: 10)],
                          Expanded(child: Text(widget.title ?? '', style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis)),
                          if (_audioTracks.length > 1)
                            PopupMenuButton<mk.AudioTrack>(
                              tooltip: 'Ses Dili', icon: const Icon(Icons.audiotrack, color: Colors.white70, size: 20), offset: const Offset(0, 40),
                              itemBuilder: (_) => _audioTracks.map((t) => PopupMenuItem(value: t, child: Text(t.title ?? t.language ?? t.id, style: const TextStyle(fontSize: 12)))).toList(),
                              onSelected: (t) => _player?.setAudioTrack(t),
                            ),
                          if (_subtitleTracks.isNotEmpty)
                            PopupMenuButton<mk.SubtitleTrack?>(
                              tooltip: 'Altyazi', icon: const Icon(Icons.closed_caption, color: Colors.white70, size: 20), offset: const Offset(0, 40),
                              itemBuilder: (_) => [
                                const PopupMenuItem(value: null, child: Text('Kapali', style: TextStyle(fontSize: 12))),
                                ..._subtitleTracks.map((t) => PopupMenuItem(value: t, child: Text(t.title ?? t.language ?? t.id, style: const TextStyle(fontSize: 12)))),
                              ],
                              onSelected: (t) => t == null ? _player?.setSubtitleTrack(mk.SubtitleTrack.no()) : _player?.setSubtitleTrack(t),
                            ),
                          if (widget.onFullscreen != null)
                            IconButton(icon: const Icon(Icons.fullscreen, color: Colors.white, size: 22), onPressed: widget.onFullscreen),
                          if (widget.onClose != null)
                            IconButton(icon: const Icon(Icons.close, color: Colors.white70, size: 20), onPressed: widget.onClose),
                        ]),
                      ),
                    ),
                  ),
                ),

                // Bottom overlay
                Positioned(
                  bottom: 0, left: 0, right: 0,
                  child: IgnorePointer(
                    ignoring: !_showControls,
                    child: AnimatedOpacity(
                      opacity: _showControls ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                        decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black87, Colors.transparent])),
                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                          // Seek bar (hidden for live)
                          if (!widget.isLive && _duration > Duration.zero)
                            Row(children: [
                              Text(_fmt(_position), style: const TextStyle(color: Colors.white70, fontSize: 11)),
                              const SizedBox(width: 6),
                              Expanded(child: SliderTheme(
                                data: SliderThemeData(trackHeight: 3, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6), activeTrackColor: cs.primary, inactiveTrackColor: Colors.white24, thumbColor: Colors.white, secondaryActiveTrackColor: Colors.white38),
                                child: Slider(
                                  value: _position.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()),
                                  max: _duration.inMilliseconds.toDouble(),
                                  secondaryTrackValue: _buffer.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()),
                                  onChanged: (v) => _player?.seek(Duration(milliseconds: v.toInt())),
                                ),
                              )),
                              const SizedBox(width: 6),
                              Text(_fmt(_duration), style: const TextStyle(color: Colors.white70, fontSize: 11)),
                            ]),
                          // Controls
                          Row(children: [
                            if (!widget.isLive)
                              IconButton(icon: const Icon(Icons.replay_10, color: Colors.white, size: 22), onPressed: () => _seekRelative(-10)),
                            IconButton(icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 26), onPressed: () => _player?.playOrPause()),
                            if (!widget.isLive)
                              IconButton(icon: const Icon(Icons.forward_10, color: Colors.white, size: 22), onPressed: () => _seekRelative(10)),
                            const SizedBox(width: 8),
                            IconButton(icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white70, size: 20), onPressed: _toggleMute),
                            SizedBox(width: 80, child: SliderTheme(
                              data: const SliderThemeData(trackHeight: 2, thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5), activeTrackColor: Colors.white70, inactiveTrackColor: Colors.white24, thumbColor: Colors.white),
                              child: Slider(value: _isMuted ? 0 : _volume, max: 100, onChanged: (v) { setState(() { _volume = v; _isMuted = false; }); _player?.setVolume(v); }),
                            )),
                            const Spacer(),
                            // Playback speed (VOD/series only)
                            if (!widget.isLive)
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
                          ]),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
