import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/di/service_locator.dart';
import 'package:iptv_macos/core/widgets/category_sidebar.dart';
import 'package:iptv_macos/core/widgets/content_poster_image.dart';
import 'package:iptv_macos/core/widgets/empty_state_widget.dart';
import 'package:iptv_macos/core/widgets/error_widget.dart';
import 'package:iptv_macos/core/widgets/loading_widget.dart';
import 'package:iptv_macos/core/widgets/player_overlay.dart';
import 'package:iptv_macos/core/widgets/search_field.dart';
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
  EpisodeEntity? _playingEpisode;
  String? _playingEpisodeUrl;
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
    final url = sl.xtreamApi.seriesStreamUrl(int.tryParse(ep.id) ?? 0, ep.containerExtension ?? 'mp4');
    setState(() { _playingEpisode = ep; _playingEpisodeUrl = url; _isFullscreen = false; });
  }

  void _stopPlayer() {
    setState(() { _playingEpisode = null; _playingEpisodeUrl = null; });
  }

  void _closeDetail() { _stopPlayer(); setState(() => _selectedSeriesId = null); }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocConsumer<SeriesBloc, SeriesState>(
      listener: (context, state) {
        if (!state.isLoading && state.seriesList.isNotEmpty && state.selectedCategoryId == null) _computeCounts(state.seriesList);
      },
      builder: (context, state) {
        if (_isFullscreen && _playingEpisodeUrl != null) return _buildFullscreenPlayer(cs);

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
      CategorySidebar(
        categories: state.categories.map((c) => (id: c.id, name: c.name)).toList(),
        counts: _catCounts,
        selectedId: state.selectedCategoryId,
        onSelected: (id) => context.read<SeriesBloc>().add(SeriesEvent.loadSeries(categoryId: id)),
      ),
      Expanded(child: Column(children: [
        SearchField(
          controller: _searchController,
          hintText: 'Dizi ara...',
          onChanged: (q) { context.read<SeriesBloc>().add(SeriesEvent.searchSeries(query: q)); setState(() {}); },
        ),
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
      Expanded(child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: _playingEpisodeUrl != null
              ? InlinePlayer(
                  url: _playingEpisodeUrl!,
                  title: _playingEpisode?.title,
                  onClose: _stopPlayer,
                  onFullscreen: () => setState(() => _isFullscreen = true),
                )
              : _buildPlayerPlaceholder(cs),
        ),
      )),
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

  // ── FULLSCREEN ──
  Widget _buildFullscreenPlayer(ColorScheme cs) {
    return InlinePlayer(
      url: _playingEpisodeUrl!,
      title: _playingEpisode?.title,
      onClose: _stopPlayer,
      onFullscreen: () => setState(() => _isFullscreen = false),
      topExtra: IconButton(
        icon: const Icon(Icons.fullscreen_exit, color: Colors.white, size: 24),
        onPressed: () => setState(() => _isFullscreen = false),
      ),
    );
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
