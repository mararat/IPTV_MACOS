import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart' as mk;
import 'package:media_kit_video/media_kit_video.dart';
import 'package:iptv_macos/core/di/service_locator.dart';
import 'package:iptv_macos/core/theme/app_colors.dart';
import 'package:iptv_macos/core/widgets/content_poster_image.dart';
import 'package:iptv_macos/core/widgets/empty_state_widget.dart';
import 'package:iptv_macos/core/widgets/error_widget.dart';
import 'package:iptv_macos/core/widgets/loading_widget.dart';
import 'package:iptv_macos/features/catalog/domain/entities/vod_entity.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/vod_bloc.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/vod_event.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/vod_state.dart';

class VodListPage extends StatefulWidget {
  const VodListPage({super.key, this.onBack});
  final VoidCallback? onBack;
  @override
  State<VodListPage> createState() => _VodListPageState();
}

class _VodListPageState extends State<VodListPage> {
  Map<String, int> _catCounts = {};
  mk.Player? _player;
  VideoController? _videoController;
  VodEntity? _activeVod;
  bool _isFullscreen = false;
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
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final bloc = context.read<VodBloc>();
    if (bloc.state.vodList.isEmpty) {
      bloc..add(const VodEvent.loadCategories())..add(const VodEvent.loadVodList());
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    for (final s in _subs) s.cancel();
    _player?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _computeCounts(List<VodEntity> items) {
    final counts = <String, int>{};
    for (final item in items) counts[item.categoryId ?? ''] = (counts[item.categoryId ?? ''] ?? 0) + 1;
    if (mounted) setState(() => _catCounts = counts);
  }

  void _playVod(VodEntity vod) {
    if (_activeVod?.id == vod.id) return;
    for (final s in _subs) s.cancel();
    _subs.clear();
    _player?.dispose();

    final url = sl.xtreamApi.vodStreamUrl(vod.streamId ?? 0, vod.containerExtension ?? 'mp4');
    _player = mk.Player(configuration: const mk.PlayerConfiguration(bufferSize: 64 * 1024 * 1024, logLevel: mk.MPVLogLevel.warn));
    _videoController = VideoController(_player!);

    _subs.add(_player!.stream.position.listen((p) { if (mounted) setState(() => _position = p); }));
    _subs.add(_player!.stream.duration.listen((d) { if (mounted) setState(() => _duration = d); }));
    _subs.add(_player!.stream.buffer.listen((b) { if (mounted) setState(() => _buffer = b); }));
    _subs.add(_player!.stream.playing.listen((p) { if (mounted) setState(() => _isPlaying = p); }));
    _subs.add(_player!.stream.buffering.listen((b) { if (mounted) setState(() => _isBuffering = b); }));
    _subs.add(_player!.stream.tracks.listen((t) {
      if (mounted) setState(() {
        _audioTracks = t.audio.where((a) => a.id != 'auto' && a.id != 'no').toList();
        _subtitleTracks = t.subtitle.where((s) => s.id != 'auto' && s.id != 'no').toList();
      });
    }));

    _player!.open(mk.Media(url));
    _player!.setVolume(_volume);
    setState(() { _activeVod = vod; _isFullscreen = false; _showControls = true; _audioTracks = []; _subtitleTracks = []; });
    _startHideTimer();
  }

  void _stopPlayer() {
    for (final s in _subs) s.cancel();
    _subs.clear();
    _player?.dispose(); _player = null; _videoController = null;
    setState(() { _activeVod = null; _position = Duration.zero; _duration = Duration.zero; });
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 4), () { if (mounted) setState(() => _showControls = false); });
  }

  void _onMouseMove() { if (!_showControls) setState(() => _showControls = true); _startHideTimer(); }

  String _fmt(Duration d) {
    final h = d.inHours; final m = d.inMinutes.remainder(60).toString().padLeft(2, '0'); final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return h > 0 ? '$h:$m:$s' : '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocConsumer<VodBloc, VodState>(
      listener: (context, state) {
        if (!state.isLoading && state.vodList.isNotEmpty && _catCounts.isEmpty && state.selectedCategoryId == null) _computeCounts(state.vodList);
      },
      builder: (context, state) {
        if (_isFullscreen && _videoController != null) return _buildFullscreenPlayer(cs);

        return Column(
          children: [
            Container(
              height: 46, padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(color: cs.surface, border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(40)))),
              child: Row(children: [
                if (widget.onBack != null) IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 20), onPressed: _activeVod != null ? _stopPlayer : widget.onBack),
                Text(_activeVod != null ? _activeVod!.title : 'Filmler', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: cs.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
                const Spacer(),
                if (_activeVod == null && state.vodList.isNotEmpty) Text('${state.vodList.length} film', style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
              ]),
            ),
            Expanded(
              child: _activeVod != null && _videoController != null
                ? _buildPlayerView(cs)
                : _buildListView(state, cs),
            ),
          ],
        );
      },
    );
  }

  Widget _buildListView(VodState state, ColorScheme cs) {
    return Row(children: [
      Container(width: 200, decoration: BoxDecoration(color: AppColors.primary, border: Border(right: BorderSide(color: AppColors.primaryDark))),
        child: Column(children: [
          _CatTile(label: 'Tümü', count: null, selected: state.selectedCategoryId == null, onTap: () => context.read<VodBloc>().add(const VodEvent.loadVodList())),
          Divider(height: 1, color: Colors.white.withAlpha(20)),
          Expanded(child: ListView.builder(itemCount: state.categories.length, itemBuilder: (_, i) {
            final c = state.categories[i];
            return _CatTile(label: c.name, count: _catCounts[c.id], selected: c.id == state.selectedCategoryId, onTap: () => context.read<VodBloc>().add(VodEvent.loadVodList(categoryId: c.id)));
          })),
        ])),
      Expanded(child: Column(children: [
        Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
          child: TextField(controller: _searchController, style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(hintText: 'Film ara...', prefixIcon: const Icon(Icons.search, size: 18), isDense: true, contentPadding: const EdgeInsets.symmetric(vertical: 8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
              suffixIcon: _searchController.text.isNotEmpty ? IconButton(icon: const Icon(Icons.close, size: 16), onPressed: () { _searchController.clear(); context.read<VodBloc>().add(const VodEvent.searchVod(query: '')); setState(() {}); }) : null),
            onChanged: (q) { context.read<VodBloc>().add(VodEvent.searchVod(query: q)); setState(() {}); })),
        Expanded(child: _buildGrid(state, cs)),
      ])),
    ]);
  }

  Widget _buildGrid(VodState state, ColorScheme cs) {
    if (state.isLoading && state.vodList.isEmpty) return const LoadingWidget(message: 'Filmler yükleniyor...');
    if (state.errorMessage != null && state.vodList.isEmpty) return AppErrorWidget(message: state.errorMessage!, onRetry: () => context.read<VodBloc>().add(const VodEvent.loadVodList()));
    if (state.vodList.isEmpty) return const EmptyStateWidget(message: 'Film bulunamadı', icon: Icons.movie_outlined);
    return GridView.builder(padding: const EdgeInsets.all(14),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150, childAspectRatio: 0.55, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemCount: state.vodList.length, itemBuilder: (_, i) => _VodCard(vod: state.vodList[i], onTap: () => _playVod(state.vodList[i])));
  }

  // ── Full player view (like series) ──
  Widget _buildPlayerView(ColorScheme cs) {
    return Row(children: [
      // Left: film info
      SizedBox(width: 280, child: Container(
        decoration: BoxDecoration(border: Border(right: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
        child: ListView(padding: const EdgeInsets.all(16), children: [
          if (_activeVod!.posterUrl != null) ClipRRect(borderRadius: BorderRadius.circular(10), child: SizedBox(height: 200, child: ContentPosterImage(imageUrl: _activeVod!.posterUrl, fallbackIcon: Icons.movie))),
          const SizedBox(height: 14),
          Text(_activeVod!.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: cs.onSurface)),
          const SizedBox(height: 6),
          if (_activeVod!.releaseYear != null) Text(_activeVod!.releaseYear!, style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
          if (_activeVod!.genre != null) Padding(padding: const EdgeInsets.only(top: 4), child: Text(_activeVod!.genre!, style: TextStyle(fontSize: 11, color: cs.primary))),
          if (_activeVod!.rating != null && _activeVod!.rating! > 0) Padding(padding: const EdgeInsets.only(top: 6), child: Row(children: [
            const Icon(Icons.star_rounded, color: Colors.amber, size: 16), const SizedBox(width: 4),
            Text(_activeVod!.rating!.toStringAsFixed(1), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: cs.onSurface)),
            Text(' / 10', style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
          ])),
          if (_activeVod!.duration != null) Padding(padding: const EdgeInsets.only(top: 6), child: Row(children: [
            Icon(Icons.schedule, size: 14, color: cs.onSurfaceVariant), const SizedBox(width: 4),
            Text(_activeVod!.duration!, style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
          ])),
          if (_activeVod!.description != null && _activeVod!.description!.isNotEmpty)
            Padding(padding: const EdgeInsets.only(top: 12), child: Text(_activeVod!.description!, style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant, height: 1.4))),
          const SizedBox(height: 16),
          FilledButton.icon(icon: const Icon(Icons.stop, size: 18), label: const Text('Filmi Kapat'), onPressed: _stopPlayer,
            style: FilledButton.styleFrom(backgroundColor: cs.error, foregroundColor: Colors.white)),
        ]),
      )),
      // Right: player
      Expanded(child: MouseRegion(onHover: (_) => _onMouseMove(), child: Container(color: Colors.black, child: Stack(fit: StackFit.expand, children: [
        Video(controller: _videoController!, controls: (_) => const SizedBox.shrink()),
        if (_isBuffering) const Center(child: CircularProgressIndicator(color: Colors.white70, strokeWidth: 3)),
        // Top
        Positioned(top: 0, left: 0, right: 0, child: AnimatedOpacity(opacity: _showControls ? 1.0 : 0.0, duration: const Duration(milliseconds: 200),
          child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black87, Colors.transparent])),
            child: Row(children: [
              Expanded(child: Text(_activeVod!.title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis)),
              if (_audioTracks.length > 1) PopupMenuButton<mk.AudioTrack>(tooltip: 'Ses Dili', icon: const Icon(Icons.audiotrack, color: Colors.white70, size: 20), offset: const Offset(0, 40),
                itemBuilder: (_) => _audioTracks.map((t) => PopupMenuItem(value: t, child: Text(t.title ?? t.language ?? t.id, style: const TextStyle(fontSize: 12)))).toList(),
                onSelected: (t) => _player?.setAudioTrack(t)),
              if (_subtitleTracks.isNotEmpty) PopupMenuButton<mk.SubtitleTrack?>(tooltip: 'Altyazı', icon: const Icon(Icons.closed_caption, color: Colors.white70, size: 20), offset: const Offset(0, 40),
                itemBuilder: (_) => [const PopupMenuItem(value: null, child: Text('Kapalı', style: TextStyle(fontSize: 12))), ..._subtitleTracks.map((t) => PopupMenuItem(value: t, child: Text(t.title ?? t.language ?? t.id, style: const TextStyle(fontSize: 12))))],
                onSelected: (t) => t == null ? _player?.setSubtitleTrack(mk.SubtitleTrack.no()) : _player?.setSubtitleTrack(t)),
              IconButton(icon: const Icon(Icons.fullscreen, color: Colors.white, size: 22), onPressed: () => setState(() => _isFullscreen = true)),
            ])))),
        // Bottom
        Positioned(bottom: 0, left: 0, right: 0, child: AnimatedOpacity(opacity: _showControls ? 1.0 : 0.0, duration: const Duration(milliseconds: 200),
          child: Container(padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black87, Colors.transparent])),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              if (_duration > Duration.zero) Row(children: [
                Text(_fmt(_position), style: const TextStyle(color: Colors.white70, fontSize: 11)), const SizedBox(width: 6),
                Expanded(child: SliderTheme(data: SliderThemeData(trackHeight: 3, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6), activeTrackColor: cs.primary, inactiveTrackColor: Colors.white24, thumbColor: Colors.white, secondaryActiveTrackColor: Colors.white38),
                  child: Slider(value: _position.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()), max: _duration.inMilliseconds.toDouble(), secondaryTrackValue: _buffer.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()), onChanged: (v) => _player?.seek(Duration(milliseconds: v.toInt()))))),
                const SizedBox(width: 6), Text(_fmt(_duration), style: const TextStyle(color: Colors.white70, fontSize: 11)),
              ]),
              Row(children: [
                IconButton(icon: const Icon(Icons.replay_10, color: Colors.white, size: 22), onPressed: () { final p = _position - const Duration(seconds: 10); _player?.seek(p < Duration.zero ? Duration.zero : p); }),
                IconButton(icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 26), onPressed: () => _player?.playOrPause()),
                IconButton(icon: const Icon(Icons.forward_10, color: Colors.white, size: 22), onPressed: () { var p = _position + const Duration(seconds: 10); if (p > _duration && _duration > Duration.zero) p = _duration; _player?.seek(p); }),
                const SizedBox(width: 8),
                IconButton(icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white70, size: 20), onPressed: () { _isMuted = !_isMuted; _player?.setVolume(_isMuted ? 0 : _volume); setState(() {}); }),
                SizedBox(width: 80, child: SliderTheme(data: const SliderThemeData(trackHeight: 2, thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5), activeTrackColor: Colors.white70, inactiveTrackColor: Colors.white24, thumbColor: Colors.white),
                  child: Slider(value: _isMuted ? 0 : _volume, max: 100, onChanged: (v) { setState(() { _volume = v; _isMuted = false; }); _player?.setVolume(v); }))),
                const Spacer(),
              ]),
            ])))),
      ])))),
    ]);
  }

  // ── Fullscreen ──
  Widget _buildFullscreenPlayer(ColorScheme cs) {
    return MouseRegion(onHover: (_) => _onMouseMove(), child: Container(color: Colors.black, child: Stack(fit: StackFit.expand, children: [
      Video(controller: _videoController!, controls: (_) => const SizedBox.shrink()),
      if (_isBuffering) const Center(child: CircularProgressIndicator(color: Colors.white70)),
      Positioned(top: 0, left: 0, right: 0, child: AnimatedOpacity(opacity: _showControls ? 1.0 : 0.0, duration: const Duration(milliseconds: 200),
        child: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black87, Colors.transparent])),
          child: Row(children: [
            IconButton(icon: const Icon(Icons.fullscreen_exit, color: Colors.white, size: 24), onPressed: () => setState(() => _isFullscreen = false)),
            const SizedBox(width: 8),
            Expanded(child: Text(_activeVod!.title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600))),
            if (_audioTracks.length > 1) PopupMenuButton<mk.AudioTrack>(tooltip: 'Ses', icon: const Icon(Icons.audiotrack, color: Colors.white70, size: 22), offset: const Offset(0, 40),
              itemBuilder: (_) => _audioTracks.map((t) => PopupMenuItem(value: t, child: Text(t.title ?? t.language ?? t.id))).toList(), onSelected: (t) => _player?.setAudioTrack(t)),
            if (_subtitleTracks.isNotEmpty) PopupMenuButton<mk.SubtitleTrack?>(tooltip: 'Altyazı', icon: const Icon(Icons.closed_caption, color: Colors.white70, size: 22), offset: const Offset(0, 40),
              itemBuilder: (_) => [const PopupMenuItem(value: null, child: Text('Kapalı')), ..._subtitleTracks.map((t) => PopupMenuItem(value: t, child: Text(t.title ?? t.language ?? t.id)))],
              onSelected: (t) => t == null ? _player?.setSubtitleTrack(mk.SubtitleTrack.no()) : _player?.setSubtitleTrack(t)),
          ])))),
      Positioned(bottom: 0, left: 0, right: 0, child: AnimatedOpacity(opacity: _showControls ? 1.0 : 0.0, duration: const Duration(milliseconds: 200),
        child: Container(padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black87, Colors.transparent])),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            if (_duration > Duration.zero) Row(children: [
              Text(_fmt(_position), style: const TextStyle(color: Colors.white70, fontSize: 12)), const SizedBox(width: 8),
              Expanded(child: SliderTheme(data: SliderThemeData(trackHeight: 3, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7), activeTrackColor: cs.primary, inactiveTrackColor: Colors.white24, thumbColor: Colors.white, secondaryActiveTrackColor: Colors.white38),
                child: Slider(value: _position.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()), max: _duration.inMilliseconds.toDouble(), secondaryTrackValue: _buffer.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()), onChanged: (v) => _player?.seek(Duration(milliseconds: v.toInt()))))),
              const SizedBox(width: 8), Text(_fmt(_duration), style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ]),
            Row(children: [
              IconButton(icon: const Icon(Icons.replay_10, color: Colors.white, size: 26), onPressed: () { final p = _position - const Duration(seconds: 10); _player?.seek(p < Duration.zero ? Duration.zero : p); }),
              IconButton(icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 32), onPressed: () => _player?.playOrPause()),
              IconButton(icon: const Icon(Icons.forward_10, color: Colors.white, size: 26), onPressed: () { var p = _position + const Duration(seconds: 10); if (p > _duration && _duration > Duration.zero) p = _duration; _player?.seek(p); }),
              const SizedBox(width: 12),
              IconButton(icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white70, size: 22), onPressed: () { _isMuted = !_isMuted; _player?.setVolume(_isMuted ? 0 : _volume); setState(() {}); }),
              SizedBox(width: 110, child: SliderTheme(data: const SliderThemeData(trackHeight: 2, thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6), activeTrackColor: Colors.white70, inactiveTrackColor: Colors.white24, thumbColor: Colors.white),
                child: Slider(value: _isMuted ? 0 : _volume, max: 100, onChanged: (v) { setState(() { _volume = v; _isMuted = false; }); _player?.setVolume(v); }))),
            ]),
          ])))),
    ])));
  }
}

// ── Widgets ──
class _VodCard extends StatefulWidget {
  const _VodCard({required this.vod, required this.onTap});
  final VodEntity vod; final VoidCallback onTap;
  @override State<_VodCard> createState() => _VodCardState();
}
class _VodCardState extends State<_VodCard> {
  bool _h = false;
  @override Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return MouseRegion(onEnter: (_) => setState(() => _h = true), onExit: (_) => setState(() => _h = false), cursor: SystemMouseCursors.click,
      child: GestureDetector(onTap: widget.onTap, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: Stack(fit: StackFit.expand, children: [
          ClipRRect(borderRadius: BorderRadius.circular(8), child: ContentPosterImage(imageUrl: widget.vod.posterUrl, fallbackIcon: Icons.movie)),
          if (_h) Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black38), child: const Center(child: Icon(Icons.play_circle_filled, color: Colors.white, size: 36))),
          if (widget.vod.rating != null && widget.vod.rating! > 0)
            Positioned(top: 4, right: 4, child: Container(padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2), decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.star_rounded, color: Colors.amber, size: 12), const SizedBox(width: 2), Text(widget.vod.rating!.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600))]))),
        ])),
        const SizedBox(height: 4),
        Text(widget.vod.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: cs.onSurface)),
        if (widget.vod.releaseYear != null) Text(widget.vod.releaseYear!, style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
      ])));
  }
}

class _CatTile extends StatelessWidget {
  const _CatTile({required this.label, this.count, required this.selected, required this.onTap});
  final String label; final int? count; final bool selected; final VoidCallback onTap;
  @override Widget build(BuildContext context) {
    return Material(color: selected ? Colors.white.withAlpha(25) : Colors.transparent,
      child: InkWell(onTap: onTap, hoverColor: Colors.white.withAlpha(12),
        child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(border: Border(left: BorderSide(color: selected ? Colors.white : Colors.transparent, width: 3))),
          child: Row(children: [
            Expanded(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13, fontWeight: selected ? FontWeight.w600 : FontWeight.w400, color: selected ? Colors.white : Colors.white.withAlpha(200)))),
            if (count != null) Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1), decoration: BoxDecoration(color: Colors.white.withAlpha(18), borderRadius: BorderRadius.circular(4)),
              child: Text('$count', style: TextStyle(fontSize: 10, color: Colors.white.withAlpha(170)))),
          ]))));
  }
}
