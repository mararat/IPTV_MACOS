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
import 'package:iptv_macos/features/series/domain/entities/series_entity.dart';
import 'package:iptv_macos/features/series/domain/entities/series_detail_entity.dart';
import 'package:iptv_macos/features/series/presentation/bloc/series_bloc.dart';
import 'package:iptv_macos/features/series/presentation/bloc/series_event.dart';
import 'package:iptv_macos/features/series/presentation/bloc/series_state.dart';

class SeriesListPage extends StatefulWidget {
  const SeriesListPage({super.key, this.onBack});
  final VoidCallback? onBack;
  @override
  State<SeriesListPage> createState() => _SeriesListPageState();
}

class _SeriesListPageState extends State<SeriesListPage> {
  Map<String, int> _catCounts = {};
  final _searchController = TextEditingController();
  int? _selectedSeriesId;
  int _selectedSeason = 0;

  // Player
  mk.Player? _player;
  VideoController? _videoController;
  EpisodeEntity? _playingEpisode;
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

  @override
  void initState() {
    super.initState();
    final bloc = context.read<SeriesBloc>();
    if (bloc.state.seriesList.isEmpty) {
      bloc..add(const SeriesEvent.loadCategories())..add(const SeriesEvent.loadSeries());
    } else {
      _computeCounts(bloc.state.seriesList);
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    for (final s in _subs) { s.cancel(); }
    _player?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _computeCounts(List<SeriesEntity> items) {
    final counts = <String, int>{};
    for (final s in items) { counts[s.categoryId ?? ''] = (counts[s.categoryId ?? ''] ?? 0) + 1; }
    _catCounts = counts;
  }

  void _openSeriesDetail(int seriesId) {
    setState(() { _selectedSeriesId = seriesId; _selectedSeason = 0; });
    context.read<SeriesBloc>().add(SeriesEvent.loadSeriesInfo(seriesId: seriesId));
  }

  void _playEpisode(EpisodeEntity ep) {
    if (_playingEpisode?.id == ep.id) return;
    for (final s in _subs) { s.cancel(); }
    _subs.clear();
    _player?.dispose();

    final url = sl.xtreamApi.seriesStreamUrl(int.tryParse(ep.id) ?? 0, ep.containerExtension ?? 'mp4');
    _player = mk.Player(configuration: const mk.PlayerConfiguration(bufferSize: 64 * 1024 * 1024, logLevel: mk.MPVLogLevel.warn));
    _videoController = VideoController(_player!);

    // Stream listeners
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

    _player!.open(mk.Media(url));
    _player!.setVolume(_volume);

    setState(() { _playingEpisode = ep; _isFullscreen = false; _showControls = true; _audioTracks = []; _subtitleTracks = []; });
    _startHideTimer();
  }

  void _stopPlayer() {
    for (final s in _subs) { s.cancel(); }
    _subs.clear();
    _player?.dispose(); _player = null; _videoController = null;
    setState(() { _playingEpisode = null; _position = Duration.zero; _duration = Duration.zero; });
  }

  void _closeDetail() { _stopPlayer(); setState(() => _selectedSeriesId = null); }

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

    return BlocConsumer<SeriesBloc, SeriesState>(
      listener: (context, state) {
        if (!state.isLoading && state.seriesList.isNotEmpty && state.selectedCategoryId == null) _computeCounts(state.seriesList);
      },
      builder: (context, state) {
        if (_isFullscreen && _videoController != null) return _buildFullscreenPlayer(cs);

        return Column(
          children: [
            // Header
            Container(
              height: 46, padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(color: cs.surface, border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(40)))),
              child: Row(children: [
                if (widget.onBack != null) IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 20), onPressed: _selectedSeriesId != null ? _closeDetail : widget.onBack),
                Text(_selectedSeriesId != null ? (state.selectedSeriesDetail?.name ?? 'Detay') : 'Diziler', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: cs.onSurface)),
                const Spacer(),
                if (_selectedSeriesId == null && state.seriesList.isNotEmpty) Text('${state.seriesList.length} dizi', style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
              ]),
            ),
            Expanded(child: _selectedSeriesId != null ? _buildDetailView(state, cs) : _buildListView(state, cs)),
          ],
        );
      },
    );
  }

  // ── LIST VIEW ──
  Widget _buildListView(SeriesState state, ColorScheme cs) {
    return Row(children: [
      Container(width: 200, decoration: BoxDecoration(color: AppColors.primary, border: Border(right: BorderSide(color: AppColors.primaryDark))),
        child: Column(children: [
          _CatTile(label: 'Tümü', count: null, selected: state.selectedCategoryId == null, onTap: () => context.read<SeriesBloc>().add(const SeriesEvent.loadSeries())),
          Divider(height: 1, color: Colors.white.withAlpha(20)),
          Expanded(child: ListView.builder(itemCount: state.categories.length, itemBuilder: (_, i) {
            final c = state.categories[i];
            return _CatTile(label: c.name, count: _catCounts[c.id], selected: c.id == state.selectedCategoryId, onTap: () => context.read<SeriesBloc>().add(SeriesEvent.loadSeries(categoryId: c.id)));
          })),
        ])),
      Expanded(child: Column(children: [
        Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
          child: TextField(controller: _searchController, style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(hintText: 'Dizi ara...', prefixIcon: const Icon(Icons.search, size: 18), isDense: true, contentPadding: const EdgeInsets.symmetric(vertical: 8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
              suffixIcon: _searchController.text.isNotEmpty ? IconButton(icon: const Icon(Icons.close, size: 16), onPressed: () { _searchController.clear(); context.read<SeriesBloc>().add(const SeriesEvent.searchSeries(query: '')); setState(() {}); }) : null),
            onChanged: (q) { context.read<SeriesBloc>().add(SeriesEvent.searchSeries(query: q)); setState(() {}); })),
        Expanded(child: _buildGrid(state, cs)),
      ])),
    ]);
  }

  Widget _buildGrid(SeriesState state, ColorScheme cs) {
    if (state.isLoading && state.seriesList.isEmpty) return const LoadingWidget(message: 'Diziler yükleniyor...');
    if (state.errorMessage != null && state.seriesList.isEmpty) return AppErrorWidget(message: state.errorMessage!, onRetry: () => context.read<SeriesBloc>().add(const SeriesEvent.loadSeries()));
    if (state.seriesList.isEmpty) return const EmptyStateWidget(message: 'Dizi bulunamadı', icon: Icons.tv_outlined);
    return GridView.builder(padding: const EdgeInsets.all(14), gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150, childAspectRatio: 0.55, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemCount: state.seriesList.length, itemBuilder: (_, i) => _SeriesCard(series: state.seriesList[i], onTap: () => _openSeriesDetail(state.seriesList[i].seriesId)));
  }

  // ── DETAIL VIEW — %25 episode list, %75 player ──
  Widget _buildDetailView(SeriesState state, ColorScheme cs) {
    if (state.isLoadingDetail) return const LoadingWidget(message: 'Dizi detayı yükleniyor...');
    final detail = state.selectedSeriesDetail;
    if (detail == null) return const EmptyStateWidget(message: 'Detay bulunamadı');

    return Row(children: [
      // LEFT %25 — series info + seasons + episodes
      SizedBox(
        width: 300,
        child: Column(children: [
          // Series info card
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: cs.surfaceContainerHighest.withAlpha(40), border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
            child: Row(children: [
              if (detail.cover != null) ClipRRect(borderRadius: BorderRadius.circular(8), child: SizedBox(width: 50, height: 70, child: ContentPosterImage(imageUrl: detail.cover, fallbackIcon: Icons.tv))),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                if (detail.genre != null) Text(detail.genre!, style: TextStyle(fontSize: 10, color: cs.primary, fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                if (detail.rating != null && detail.rating! > 0) Row(children: [
                  const Icon(Icons.star_rounded, color: Colors.amber, size: 13), const SizedBox(width: 3),
                  Text(detail.rating!.toStringAsFixed(1), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: cs.onSurface)),
                  Text(' / 10', style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
                ]),
                if (detail.releaseDate != null) Padding(padding: const EdgeInsets.only(top: 2), child: Text(detail.releaseDate!, style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant))),
              ])),
            ]),
          ),
          // Season tabs
          if (detail.seasons.isNotEmpty)
            Container(
              height: 38,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
              child: ListView.builder(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), itemCount: detail.seasons.length, itemBuilder: (_, i) {
                final s = detail.seasons[i]; final sel = i == _selectedSeason;
                return Padding(padding: const EdgeInsets.only(right: 4), child: Material(
                  color: sel ? cs.primary : Colors.transparent, borderRadius: BorderRadius.circular(6),
                  child: InkWell(onTap: () => setState(() => _selectedSeason = i), borderRadius: BorderRadius.circular(6),
                    child: Container(padding: const EdgeInsets.symmetric(horizontal: 12), alignment: Alignment.center,
                      child: Text(s.name ?? 'S${s.seasonNumber ?? i + 1}', style: TextStyle(fontSize: 11, fontWeight: sel ? FontWeight.w600 : FontWeight.w400, color: sel ? Colors.white : cs.onSurfaceVariant))))));
              }),
            ),
          // Episode list
          Expanded(child: _buildEpisodeList(detail, cs)),
        ]),
      ),
      // RIGHT %75 — player
      Expanded(child: _videoController != null ? _buildInlinePlayer(cs) : _buildPlayerPlaceholder(cs)),
    ]);
  }

  Widget _buildEpisodeList(SeriesDetailEntity detail, ColorScheme cs) {
    if (detail.seasons.isEmpty) return const EmptyStateWidget(message: 'Sezon bulunamadı');
    final seasonNum = detail.seasons[_selectedSeason].seasonNumber ?? (_selectedSeason + 1);
    final episodes = detail.episodes['$seasonNum'] ?? [];
    if (episodes.isEmpty) return const EmptyStateWidget(message: 'Bölüm bulunamadı');

    return ListView.builder(padding: const EdgeInsets.symmetric(vertical: 2), itemCount: episodes.length, itemBuilder: (_, i) {
      final ep = episodes[i]; final playing = _playingEpisode?.id == ep.id;
      return _EpisodeTile(episode: ep, isPlaying: playing, onTap: () => _playEpisode(ep));
    });
  }

  Widget _buildPlayerPlaceholder(ColorScheme cs) {
    return Container(color: cs.surfaceContainerHighest.withAlpha(30),
      child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.play_circle_outline, size: 64, color: cs.onSurfaceVariant.withAlpha(40)),
        const SizedBox(height: 12),
        Text('Bir bölüm seçin', style: TextStyle(fontSize: 14, color: cs.onSurfaceVariant.withAlpha(80))),
      ])));
  }

  Widget _buildInlinePlayer(ColorScheme cs) {
    return MouseRegion(onHover: (_) => _onMouseMove(), child: Container(color: Colors.black, child: Stack(fit: StackFit.expand, children: [
      Video(controller: _videoController!, controls: (_) => const SizedBox.shrink()),
      if (_isBuffering) const Center(child: CircularProgressIndicator(color: Colors.white70, strokeWidth: 3)),
      // Top bar
      Positioned(top: 0, left: 0, right: 0, child: AnimatedOpacity(opacity: _showControls ? 1.0 : 0.0, duration: const Duration(milliseconds: 200),
        child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black87, Colors.transparent])),
          child: Row(children: [
            Expanded(child: Text(_playingEpisode?.title ?? '', style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis)),
            // Audio tracks
            if (_audioTracks.length > 1) PopupMenuButton<mk.AudioTrack>(
              tooltip: 'Ses', icon: const Icon(Icons.audiotrack, color: Colors.white70, size: 20),
              offset: const Offset(0, 40),
              itemBuilder: (_) => _audioTracks.map((t) => PopupMenuItem(value: t, child: Text(t.title ?? t.language ?? t.id, style: const TextStyle(fontSize: 12)))).toList(),
              onSelected: (t) => _player?.setAudioTrack(t),
            ),
            // Subtitle tracks
            if (_subtitleTracks.isNotEmpty) PopupMenuButton<mk.SubtitleTrack?>(
              tooltip: 'Altyazı', icon: const Icon(Icons.closed_caption, color: Colors.white70, size: 20),
              offset: const Offset(0, 40),
              itemBuilder: (_) => [
                const PopupMenuItem(value: null, child: Text('Kapalı', style: TextStyle(fontSize: 12))),
                ..._subtitleTracks.map((t) => PopupMenuItem(value: t, child: Text(t.title ?? t.language ?? t.id, style: const TextStyle(fontSize: 12)))),
              ],
              onSelected: (t) => t == null ? _player?.setSubtitleTrack(mk.SubtitleTrack.no()) : _player?.setSubtitleTrack(t),
            ),
            IconButton(icon: const Icon(Icons.fullscreen, color: Colors.white, size: 22), onPressed: () => setState(() => _isFullscreen = true)),
            IconButton(icon: const Icon(Icons.close, color: Colors.white70, size: 20), onPressed: _stopPlayer),
          ])))),
      // Bottom bar — seek + controls
      Positioned(bottom: 0, left: 0, right: 0, child: AnimatedOpacity(opacity: _showControls ? 1.0 : 0.0, duration: const Duration(milliseconds: 200),
        child: Container(padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
          decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black87, Colors.transparent])),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // Seek bar
            if (_duration > Duration.zero) Row(children: [
              Text(_fmt(_position), style: const TextStyle(color: Colors.white70, fontSize: 11)),
              const SizedBox(width: 6),
              Expanded(child: SliderTheme(data: SliderThemeData(trackHeight: 3, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6), activeTrackColor: cs.primary, inactiveTrackColor: Colors.white24, thumbColor: Colors.white, secondaryActiveTrackColor: Colors.white38),
                child: Slider(value: _position.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()), max: _duration.inMilliseconds.toDouble(), secondaryTrackValue: _buffer.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()), onChanged: (v) => _player?.seek(Duration(milliseconds: v.toInt()))))),
              const SizedBox(width: 6),
              Text(_fmt(_duration), style: const TextStyle(color: Colors.white70, fontSize: 11)),
            ]),
            // Controls
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
    ])));
  }

  // ── FULLSCREEN ──
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
            Expanded(child: Text(_playingEpisode?.title ?? '', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600))),
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
              Text(_fmt(_position), style: const TextStyle(color: Colors.white70, fontSize: 12)),
              const SizedBox(width: 8),
              Expanded(child: SliderTheme(data: SliderThemeData(trackHeight: 3, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7), activeTrackColor: cs.primary, inactiveTrackColor: Colors.white24, thumbColor: Colors.white, secondaryActiveTrackColor: Colors.white38),
                child: Slider(value: _position.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()), max: _duration.inMilliseconds.toDouble(), secondaryTrackValue: _buffer.inMilliseconds.toDouble().clamp(0, _duration.inMilliseconds.toDouble()), onChanged: (v) => _player?.seek(Duration(milliseconds: v.toInt()))))),
              const SizedBox(width: 8),
              Text(_fmt(_duration), style: const TextStyle(color: Colors.white70, fontSize: 12)),
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

// ── WIDGETS ──

class _EpisodeTile extends StatefulWidget {
  const _EpisodeTile({required this.episode, required this.isPlaying, required this.onTap});
  final EpisodeEntity episode; final bool isPlaying; final VoidCallback onTap;
  @override State<_EpisodeTile> createState() => _EpisodeTileState();
}
class _EpisodeTileState extends State<_EpisodeTile> {
  bool _h = false;
  @override Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme; final ep = widget.episode;
    return MouseRegion(onEnter: (_) => setState(() => _h = true), onExit: (_) => setState(() => _h = false), cursor: SystemMouseCursors.click,
      child: GestureDetector(onTap: widget.onTap, child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(color: widget.isPlaying ? cs.primaryContainer.withAlpha(100) : (_h ? cs.surfaceContainerHighest.withAlpha(50) : Colors.transparent), border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(15)))),
        child: Row(children: [
          Container(width: 28, height: 28, decoration: BoxDecoration(color: widget.isPlaying ? cs.primary : cs.surfaceContainerHighest, borderRadius: BorderRadius.circular(6)),
            child: Center(child: Text('${ep.episodeNum ?? '?'}', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: widget.isPlaying ? Colors.white : cs.onSurface)))),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(ep.title ?? 'Bölüm ${ep.episodeNum ?? ''}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, fontWeight: widget.isPlaying ? FontWeight.w600 : FontWeight.w400, color: widget.isPlaying ? cs.primary : cs.onSurface)),
            if (ep.duration != null && ep.duration!.isNotEmpty) Text(ep.duration!, style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
          ])),
          if (_h || widget.isPlaying) Icon(widget.isPlaying ? Icons.play_circle_filled : Icons.play_circle_outline, size: 18, color: widget.isPlaying ? cs.primary : cs.onSurfaceVariant),
        ]))));
  }
}

class _SeriesCard extends StatefulWidget {
  const _SeriesCard({required this.series, required this.onTap});
  final SeriesEntity series; final VoidCallback onTap;
  @override State<_SeriesCard> createState() => _SeriesCardState();
}
class _SeriesCardState extends State<_SeriesCard> {
  bool _h = false;
  @override Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return MouseRegion(onEnter: (_) => setState(() => _h = true), onExit: (_) => setState(() => _h = false), cursor: SystemMouseCursors.click,
      child: GestureDetector(onTap: widget.onTap, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: Stack(fit: StackFit.expand, children: [
          ClipRRect(borderRadius: BorderRadius.circular(8), child: ContentPosterImage(imageUrl: widget.series.cover, fallbackIcon: Icons.tv)),
          if (_h) Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black38), child: const Center(child: Icon(Icons.info_outline, color: Colors.white, size: 32))),
          if (widget.series.rating != null && widget.series.rating! > 0)
            Positioned(top: 4, right: 4, child: Container(padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2), decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.star_rounded, color: Colors.amber, size: 12), const SizedBox(width: 2), Text(widget.series.rating!.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600))]))),
        ])),
        const SizedBox(height: 4),
        Text(widget.series.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: cs.onSurface)),
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
