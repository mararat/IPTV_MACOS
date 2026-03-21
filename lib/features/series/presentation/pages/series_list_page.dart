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
  String? _playingEpisodeId;
  bool _isFullscreen = false;

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
    _player?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _computeCounts(List<SeriesEntity> items) {
    final counts = <String, int>{};
    for (final s in items) {
      counts[s.categoryId ?? ''] = (counts[s.categoryId ?? ''] ?? 0) + 1;
    }
    _catCounts = counts;
  }

  void _openSeriesDetail(int seriesId) {
    setState(() { _selectedSeriesId = seriesId; _selectedSeason = 0; });
    context.read<SeriesBloc>().add(SeriesEvent.loadSeriesInfo(seriesId: seriesId));
  }

  void _playEpisode(EpisodeEntity ep) {
    if (_playingEpisodeId == ep.id) return;
    _player?.dispose();
    final url = sl.xtreamApi.seriesStreamUrl(int.tryParse(ep.id) ?? 0, ep.containerExtension ?? 'mp4');
    _player = mk.Player(configuration: const mk.PlayerConfiguration(bufferSize: 32 * 1024 * 1024, logLevel: mk.MPVLogLevel.warn));
    _videoController = VideoController(_player!);
    _player!.open(mk.Media(url));
    _player!.setVolume(100);
    setState(() { _playingEpisodeId = ep.id; _isFullscreen = false; });
  }

  void _stopPlayer() {
    _player?.dispose(); _player = null; _videoController = null;
    setState(() => _playingEpisodeId = null);
  }

  void _closeDetail() {
    _stopPlayer();
    setState(() { _selectedSeriesId = null; });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocConsumer<SeriesBloc, SeriesState>(
      listener: (context, state) {
        if (!state.isLoading && state.seriesList.isNotEmpty && state.selectedCategoryId == null) {
          _computeCounts(state.seriesList);
        }
      },
      builder: (context, state) {
        if (_isFullscreen && _videoController != null) {
          return _FullscreenPlayer(controller: _videoController!, title: _playingEpisodeId ?? '', onExit: () => setState(() => _isFullscreen = false));
        }

        return Column(
          children: [
            // Header
            Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(color: cs.surface, border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(40)))),
              child: Row(
                children: [
                  if (widget.onBack != null) IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 20), onPressed: widget.onBack),
                  Text('Diziler', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: cs.onSurface)),
                  if (_selectedSeriesId != null) ...[
                    const SizedBox(width: 8),
                    Icon(Icons.chevron_right, size: 18, color: cs.onSurfaceVariant),
                    const SizedBox(width: 4),
                    Text('Detay', style: TextStyle(fontSize: 13, color: cs.onSurfaceVariant)),
                  ],
                  const Spacer(),
                  if (_selectedSeriesId != null)
                    TextButton.icon(icon: const Icon(Icons.grid_view, size: 16), label: const Text('Listeye Dön', style: TextStyle(fontSize: 12)), onPressed: _closeDetail)
                  else if (state.seriesList.isNotEmpty)
                    Text('${state.seriesList.length} dizi', style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
                ],
              ),
            ),
            // Body
            Expanded(
              child: _selectedSeriesId != null
                  ? _buildDetailView(state, cs)
                  : _buildListView(state, cs),
            ),
          ],
        );
      },
    );
  }

  // ── List View (grid + sidebar) ──
  Widget _buildListView(SeriesState state, ColorScheme cs) {
    return Row(
      children: [
        // Sidebar
        Container(
          width: 200,
          decoration: BoxDecoration(color: AppColors.primary, border: Border(right: BorderSide(color: AppColors.primaryDark))),
          child: Column(
            children: [
              _CatTile(label: 'Tümü', count: null, selected: state.selectedCategoryId == null, onTap: () => context.read<SeriesBloc>().add(const SeriesEvent.loadSeries())),
              Divider(height: 1, color: Colors.white.withAlpha(20)),
              Expanded(child: ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (_, i) {
                  final c = state.categories[i];
                  return _CatTile(label: c.name, count: _catCounts[c.id], selected: c.id == state.selectedCategoryId, onTap: () => context.read<SeriesBloc>().add(SeriesEvent.loadSeries(categoryId: c.id)));
                },
              )),
            ],
          ),
        ),
        // Content
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(hintText: 'Dizi ara...', prefixIcon: const Icon(Icons.search, size: 18), isDense: true, contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
                    suffixIcon: _searchController.text.isNotEmpty ? IconButton(icon: const Icon(Icons.close, size: 16), onPressed: () { _searchController.clear(); context.read<SeriesBloc>().add(const SeriesEvent.searchSeries(query: '')); setState(() {}); }) : null),
                  onChanged: (q) { context.read<SeriesBloc>().add(SeriesEvent.searchSeries(query: q)); setState(() {}); },
                ),
              ),
              Expanded(child: _buildGrid(state, cs)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGrid(SeriesState state, ColorScheme cs) {
    if (state.isLoading && state.seriesList.isEmpty) return const LoadingWidget(message: 'Diziler yükleniyor...');
    if (state.errorMessage != null && state.seriesList.isEmpty) return AppErrorWidget(message: state.errorMessage!, onRetry: () => context.read<SeriesBloc>().add(const SeriesEvent.loadSeries()));
    if (state.seriesList.isEmpty) return const EmptyStateWidget(message: 'Dizi bulunamadı', icon: Icons.tv_outlined);

    return GridView.builder(
      padding: const EdgeInsets.all(14),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150, childAspectRatio: 0.55, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemCount: state.seriesList.length,
      itemBuilder: (_, i) {
        final s = state.seriesList[i];
        return _SeriesCard(series: s, onTap: () => _openSeriesDetail(s.seriesId));
      },
    );
  }

  // ── Detail View (sezonlar + bölümler + player) ──
  Widget _buildDetailView(SeriesState state, ColorScheme cs) {
    if (state.isLoadingDetail) return const LoadingWidget(message: 'Dizi detayı yükleniyor...');
    final detail = state.selectedSeriesDetail;
    if (detail == null) return const EmptyStateWidget(message: 'Detay bulunamadı');

    return Row(
      children: [
        // Left: info + episodes
        Expanded(
          flex: _videoController != null ? 1 : 1,
          child: Column(
            children: [
              // Series info header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
                child: Row(
                  children: [
                    if (detail.cover != null)
                      ClipRRect(borderRadius: BorderRadius.circular(8), child: SizedBox(width: 60, height: 85, child: ContentPosterImage(imageUrl: detail.cover, fallbackIcon: Icons.tv))),
                    const SizedBox(width: 14),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(detail.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: cs.onSurface)),
                      if (detail.genre != null) Text(detail.genre!, style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
                      if (detail.rating != null && detail.rating! > 0) Row(children: [
                        const Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                        const SizedBox(width: 2),
                        Text(detail.rating!.toStringAsFixed(1), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: cs.onSurface)),
                      ]),
                      if (detail.plot != null) Padding(padding: const EdgeInsets.only(top: 6), child: Text(detail.plot!, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant))),
                    ])),
                  ],
                ),
              ),
              // Season tabs
              if (detail.seasons.isNotEmpty)
                Container(
                  height: 40,
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: detail.seasons.length,
                    itemBuilder: (_, i) {
                      final season = detail.seasons[i];
                      final isSelected = i == _selectedSeason;
                      return Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: TextButton(
                          onPressed: () => setState(() => _selectedSeason = i),
                          style: TextButton.styleFrom(
                            backgroundColor: isSelected ? cs.primaryContainer : Colors.transparent,
                            foregroundColor: isSelected ? cs.primary : cs.onSurfaceVariant,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                          ),
                          child: Text(season.name ?? 'Sezon ${season.seasonNumber ?? i + 1}', style: TextStyle(fontSize: 12, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400)),
                        ),
                      );
                    },
                  ),
                ),
              // Episode list
              Expanded(child: _buildEpisodeList(detail, cs)),
            ],
          ),
        ),
        // Right: player (if playing)
        if (_videoController != null)
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Stack(children: [
                      Video(controller: _videoController!, controls: (_) => const SizedBox.shrink()),
                      Positioned(top: 0, left: 0, right: 0, child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black54, Colors.transparent])),
                        child: Row(children: [
                          const Spacer(),
                          IconButton(icon: const Icon(Icons.fullscreen, color: Colors.white, size: 22), onPressed: () => setState(() => _isFullscreen = true)),
                          IconButton(icon: const Icon(Icons.close, color: Colors.white70, size: 20), onPressed: _stopPlayer),
                        ]),
                      )),
                    ]),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildEpisodeList(SeriesDetailEntity detail, ColorScheme cs) {
    if (detail.seasons.isEmpty) return const EmptyStateWidget(message: 'Sezon bulunamadı');
    final seasonNum = detail.seasons[_selectedSeason].seasonNumber ?? (_selectedSeason + 1);
    final episodes = detail.episodes['$seasonNum'] ?? [];

    if (episodes.isEmpty) return const EmptyStateWidget(message: 'Bölüm bulunamadı');

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 4),
      itemCount: episodes.length,
      itemBuilder: (_, i) {
        final ep = episodes[i];
        final isPlaying = _playingEpisodeId == ep.id;
        return _EpisodeTile(episode: ep, isPlaying: isPlaying, onTap: () => _playEpisode(ep));
      },
    );
  }
}

// ── Episode Tile ──
class _EpisodeTile extends StatefulWidget {
  const _EpisodeTile({required this.episode, required this.isPlaying, required this.onTap});
  final EpisodeEntity episode; final bool isPlaying; final VoidCallback onTap;
  @override
  State<_EpisodeTile> createState() => _EpisodeTileState();
}

class _EpisodeTileState extends State<_EpisodeTile> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ep = widget.episode;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isPlaying ? cs.primaryContainer.withAlpha(100) : (_hovered ? cs.surfaceContainerHighest.withAlpha(50) : Colors.transparent),
            border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(15))),
          ),
          child: Row(
            children: [
              // Episode number
              Container(
                width: 32, height: 32,
                decoration: BoxDecoration(color: widget.isPlaying ? cs.primary : cs.surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
                child: Center(child: Text('${ep.episodeNum ?? '?'}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: widget.isPlaying ? Colors.white : cs.onSurface))),
              ),
              const SizedBox(width: 12),
              // Info
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(ep.title ?? 'Bölüm ${ep.episodeNum ?? ''}', style: TextStyle(fontSize: 13, fontWeight: widget.isPlaying ? FontWeight.w600 : FontWeight.w400, color: widget.isPlaying ? cs.primary : cs.onSurface)),
                if (ep.duration != null && ep.duration!.isNotEmpty) Text(ep.duration!, style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
              ])),
              if (_hovered || widget.isPlaying) Icon(widget.isPlaying ? Icons.play_circle_filled : Icons.play_circle_outline, size: 20, color: widget.isPlaying ? cs.primary : cs.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Series Card ──
class _SeriesCard extends StatefulWidget {
  const _SeriesCard({required this.series, required this.onTap});
  final SeriesEntity series; final VoidCallback onTap;
  @override
  State<_SeriesCard> createState() => _SeriesCardState();
}

class _SeriesCardState extends State<_SeriesCard> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Stack(fit: StackFit.expand, children: [
            ClipRRect(borderRadius: BorderRadius.circular(8), child: ContentPosterImage(imageUrl: widget.series.cover, fallbackIcon: Icons.tv)),
            if (_hovered) Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black38), child: const Center(child: Icon(Icons.info_outline, color: Colors.white, size: 32))),
            if (widget.series.rating != null && widget.series.rating! > 0)
              Positioned(top: 4, right: 4, child: Container(padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2), decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.star_rounded, color: Colors.amber, size: 12), const SizedBox(width: 2), Text(widget.series.rating!.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600))]))),
          ])),
          const SizedBox(height: 4),
          Text(widget.series.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: cs.onSurface)),
        ]),
      ),
    );
  }
}

// ── Category Tile ──
class _CatTile extends StatelessWidget {
  const _CatTile({required this.label, this.count, required this.selected, required this.onTap});
  final String label; final int? count; final bool selected; final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.white.withAlpha(25) : Colors.transparent,
      child: InkWell(onTap: onTap, hoverColor: Colors.white.withAlpha(12),
        child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(border: Border(left: BorderSide(color: selected ? Colors.white : Colors.transparent, width: 3))),
          child: Row(children: [
            Expanded(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13, fontWeight: selected ? FontWeight.w600 : FontWeight.w400, color: selected ? Colors.white : Colors.white.withAlpha(200)))),
            if (count != null) Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1), decoration: BoxDecoration(color: Colors.white.withAlpha(18), borderRadius: BorderRadius.circular(4)),
              child: Text('$count', style: TextStyle(fontSize: 10, color: Colors.white.withAlpha(170)))),
          ]))),
    );
  }
}

// ── Fullscreen Player ──
class _FullscreenPlayer extends StatelessWidget {
  const _FullscreenPlayer({required this.controller, required this.title, required this.onExit});
  final VideoController controller; final String title; final VoidCallback onExit;
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black, child: Stack(fit: StackFit.expand, children: [
      Video(controller: controller, controls: (_) => const SizedBox.shrink()),
      Positioned(top: 0, left: 0, right: 0, child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black87, Colors.transparent])),
        child: Row(children: [
          IconButton(icon: const Icon(Icons.fullscreen_exit, color: Colors.white, size: 24), onPressed: onExit),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
        ]))),
    ]));
  }
}
