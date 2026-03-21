import 'dart:async';
import 'package:flutter/material.dart';
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
  List<mk.AudioTrack> _audioTracks = [];
  List<mk.SubtitleTrack> _subtitleTracks = [];
  final List<StreamSubscription<dynamic>> _subs = [];

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

    return MouseRegion(
      onHover: (_) => _onMouseMove(),
      child: Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Video(controller: _videoController!, controls: (_) => const SizedBox.shrink()),
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
                          tooltip: 'Altyazı', icon: const Icon(Icons.closed_caption, color: Colors.white70, size: 20), offset: const Offset(0, 40),
                          itemBuilder: (_) => [
                            const PopupMenuItem(value: null, child: Text('Kapalı', style: TextStyle(fontSize: 12))),
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
                          IconButton(icon: const Icon(Icons.replay_10, color: Colors.white, size: 22), onPressed: () {
                            final p = _position - const Duration(seconds: 10);
                            _player?.seek(p < Duration.zero ? Duration.zero : p);
                          }),
                        IconButton(icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 26), onPressed: () => _player?.playOrPause()),
                        if (!widget.isLive)
                          IconButton(icon: const Icon(Icons.forward_10, color: Colors.white, size: 22), onPressed: () {
                            var p = _position + const Duration(seconds: 10);
                            if (p > _duration && _duration > Duration.zero) p = _duration;
                            _player?.seek(p);
                          }),
                        const SizedBox(width: 8),
                        IconButton(icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white70, size: 20), onPressed: _toggleMute),
                        SizedBox(width: 80, child: SliderTheme(
                          data: const SliderThemeData(trackHeight: 2, thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5), activeTrackColor: Colors.white70, inactiveTrackColor: Colors.white24, thumbColor: Colors.white),
                          child: Slider(value: _isMuted ? 0 : _volume, max: 100, onChanged: (v) { setState(() { _volume = v; _isMuted = false; }); _player?.setVolume(v); }),
                        )),
                        const Spacer(),
                      ]),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
