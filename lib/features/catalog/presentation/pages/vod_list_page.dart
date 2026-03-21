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
  VodEntity? _activeVod;
  bool _isFullscreen = false;
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
    _searchController.dispose();
    super.dispose();
  }

  void _computeCounts(List<VodEntity> items) {
    final counts = <String, int>{};
    for (final item in items) { counts[item.categoryId ?? ''] = (counts[item.categoryId ?? ''] ?? 0) + 1; }
    if (mounted) { setState(() => _catCounts = counts); }
  }

  String _buildVodUrl(VodEntity vod) {
    return sl.xtreamApi.vodStreamUrl(vod.streamId, vod.containerExtension ?? 'mp4');
  }

  void _playVod(VodEntity vod) {
    if (_activeVod?.id == vod.id) return;
    setState(() { _activeVod = vod; _isFullscreen = false; });
  }

  void _stopPlayer() {
    setState(() { _activeVod = null; });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocConsumer<VodBloc, VodState>(
      listener: (context, state) {
        if (!state.isLoading && state.vodList.isNotEmpty && _catCounts.isEmpty && state.selectedCategoryId == null) _computeCounts(state.vodList);
      },
      builder: (context, state) {
        if (_isFullscreen && _activeVod != null) return _buildFullscreenPlayer(cs);

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
              child: _activeVod != null
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
      CategorySidebar(
        categories: state.categories.map((c) => (id: c.id, name: c.name)).toList(),
        counts: _catCounts,
        selectedId: state.selectedCategoryId,
        onSelected: (id) => context.read<VodBloc>().add(id == null ? const VodEvent.loadVodList() : VodEvent.loadVodList(categoryId: id)),
      ),
      Expanded(child: Column(children: [
        SearchField(
          controller: _searchController,
          hintText: 'Film ara...',
          onChanged: (q) { context.read<VodBloc>().add(VodEvent.searchVod(query: q)); setState(() {}); },
        ),
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
      Expanded(child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: InlinePlayer(
            url: _buildVodUrl(_activeVod!),
            title: _activeVod!.title,
            onClose: _stopPlayer,
            onFullscreen: () => setState(() => _isFullscreen = true),
          ),
        ),
      )),
    ]);
  }

  // ── Fullscreen ──
  Widget _buildFullscreenPlayer(ColorScheme cs) {
    return InlinePlayer(
      url: _buildVodUrl(_activeVod!),
      title: _activeVod!.title,
      onClose: _stopPlayer,
      topExtra: IconButton(
        icon: const Icon(Icons.fullscreen_exit, color: Colors.white, size: 24),
        onPressed: () => setState(() => _isFullscreen = false),
      ),
    );
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
