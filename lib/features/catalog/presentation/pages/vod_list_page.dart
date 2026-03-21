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
    _player?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _computeCounts(List<VodEntity> items) {
    final counts = <String, int>{};
    for (final item in items) {
      counts[item.categoryId ?? ''] = (counts[item.categoryId ?? ''] ?? 0) + 1;
    }
    if (mounted) setState(() => _catCounts = counts);
  }

  void _playVod(VodEntity vod) {
    if (_activeVod?.id == vod.id) return;
    _player?.dispose();
    final url = sl.xtreamApi.vodStreamUrl(vod.streamId ?? 0, vod.containerExtension ?? 'mp4');
    _player = mk.Player(configuration: const mk.PlayerConfiguration(bufferSize: 32 * 1024 * 1024, logLevel: mk.MPVLogLevel.warn));
    _videoController = VideoController(_player!);
    _player!.open(mk.Media(url));
    _player!.setVolume(100);
    setState(() { _activeVod = vod; _isFullscreen = false; });
  }

  void _stopPlayer() {
    _player?.dispose(); _player = null; _videoController = null;
    setState(() => _activeVod = null);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocConsumer<VodBloc, VodState>(
      listener: (context, state) {
        if (!state.isLoading && state.vodList.isNotEmpty && _catCounts.isEmpty && state.selectedCategoryId == null) {
          _computeCounts(state.vodList);
        }
      },
      builder: (context, state) {
        if (_isFullscreen && _videoController != null && _activeVod != null) {
          return _FullscreenPlayer(controller: _videoController!, title: _activeVod!.title, onExit: () => setState(() => _isFullscreen = false));
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
                  Text('Filmler', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: cs.onSurface)),
                  const Spacer(),
                  if (state.vodList.isNotEmpty) Text('${state.vodList.length} film', style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  // Sidebar
                  Container(
                    width: 200,
                    decoration: BoxDecoration(color: AppColors.primary, border: Border(right: BorderSide(color: AppColors.primaryDark))),
                    child: Column(
                      children: [
                        _CatTile(label: 'Tümü', count: null, selected: state.selectedCategoryId == null, onTap: () => context.read<VodBloc>().add(const VodEvent.loadVodList())),
                        Divider(height: 1, color: Colors.white.withAlpha(20)),
                        Expanded(child: ListView.builder(
                          itemCount: state.categories.length,
                          itemBuilder: (_, i) {
                            final c = state.categories[i];
                            return _CatTile(label: c.name, count: _catCounts[c.id], selected: c.id == state.selectedCategoryId, onTap: () => context.read<VodBloc>().add(VodEvent.loadVodList(categoryId: c.id)));
                          },
                        )),
                      ],
                    ),
                  ),
                  // Content: search + grid or player split
                  Expanded(
                    child: _activeVod != null && _videoController != null
                      ? Column(
                          children: [
                            // Player
                            Expanded(
                              child: Container(
                                color: Colors.black,
                                child: Stack(
                                  children: [
                                    Video(controller: _videoController!, controls: (_) => const SizedBox.shrink()),
                                    Positioned(top: 0, left: 0, right: 0, child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                      decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black87, Colors.transparent])),
                                      child: Row(children: [
                                        Expanded(child: Text(_activeVod!.title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                        IconButton(icon: const Icon(Icons.fullscreen, color: Colors.white, size: 22), onPressed: () => setState(() => _isFullscreen = true)),
                                        IconButton(icon: const Icon(Icons.close, color: Colors.white70, size: 20), onPressed: _stopPlayer),
                                      ]),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            // Info bar
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(color: cs.surfaceContainerHighest.withAlpha(80), border: Border(top: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
                              child: Row(children: [
                                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(_activeVod!.title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: cs.onSurface)),
                                  if (_activeVod!.releaseYear != null) Text(_activeVod!.releaseYear!, style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
                                ])),
                                IconButton(icon: Icon(Icons.stop_circle_outlined, size: 20, color: cs.error), onPressed: _stopPlayer),
                              ]),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            // Search
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
                              child: TextField(
                                controller: _searchController,
                                style: const TextStyle(fontSize: 12),
                                decoration: InputDecoration(hintText: 'Film ara...', prefixIcon: const Icon(Icons.search, size: 18), isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
                                  suffixIcon: _searchController.text.isNotEmpty ? IconButton(icon: const Icon(Icons.close, size: 16), onPressed: () { _searchController.clear(); context.read<VodBloc>().add(const VodEvent.searchVod(query: '')); setState(() {}); }) : null),
                                onChanged: (q) { context.read<VodBloc>().add(VodEvent.searchVod(query: q)); setState(() {}); },
                              ),
                            ),
                            Expanded(child: _buildGrid(state, cs)),
                          ],
                        ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGrid(VodState state, ColorScheme cs) {
    if (state.isLoading && state.vodList.isEmpty) return const LoadingWidget(message: 'Filmler yükleniyor...');
    if (state.errorMessage != null && state.vodList.isEmpty) return AppErrorWidget(message: state.errorMessage!, onRetry: () => context.read<VodBloc>().add(const VodEvent.loadVodList()));
    if (state.vodList.isEmpty) return const EmptyStateWidget(message: 'Film bulunamadı', icon: Icons.movie_outlined);

    return GridView.builder(
      padding: const EdgeInsets.all(14),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150, childAspectRatio: 0.55, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemCount: state.vodList.length,
      itemBuilder: (_, i) {
        final v = state.vodList[i];
        return _VodCard(vod: v, onTap: () => _playVod(v));
      },
    );
  }
}

class _VodCard extends StatefulWidget {
  const _VodCard({required this.vod, required this.onTap});
  final VodEntity vod; final VoidCallback onTap;
  @override
  State<_VodCard> createState() => _VodCardState();
}

class _VodCardState extends State<_VodCard> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(8), child: ContentPosterImage(imageUrl: widget.vod.posterUrl, fallbackIcon: Icons.movie)),
                  if (_hovered)
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black38),
                      child: const Center(child: Icon(Icons.play_circle_filled, color: Colors.white, size: 36)),
                    ),
                  if (widget.vod.rating != null && widget.vod.rating! > 0)
                    Positioned(top: 4, right: 4, child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        const Icon(Icons.star_rounded, color: Colors.amber, size: 12),
                        const SizedBox(width: 2),
                        Text(widget.vod.rating!.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600)),
                      ]),
                    )),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(widget.vod.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: cs.onSurface)),
            if (widget.vod.releaseYear != null) Text(widget.vod.releaseYear!, style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}

class _CatTile extends StatelessWidget {
  const _CatTile({required this.label, this.count, required this.selected, required this.onTap});
  final String label; final int? count; final bool selected; final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.white.withAlpha(25) : Colors.transparent,
      child: InkWell(onTap: onTap, hoverColor: Colors.white.withAlpha(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(border: Border(left: BorderSide(color: selected ? Colors.white : Colors.transparent, width: 3))),
          child: Row(children: [
            Expanded(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13, fontWeight: selected ? FontWeight.w600 : FontWeight.w400, color: selected ? Colors.white : Colors.white.withAlpha(200)))),
            if (count != null) Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1), decoration: BoxDecoration(color: Colors.white.withAlpha(18), borderRadius: BorderRadius.circular(4)),
              child: Text('$count', style: TextStyle(fontSize: 10, color: Colors.white.withAlpha(170)))),
          ]),
        ),
      ),
    );
  }
}

class _FullscreenPlayer extends StatelessWidget {
  const _FullscreenPlayer({required this.controller, required this.title, required this.onExit});
  final VideoController controller; final String title; final VoidCallback onExit;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(fit: StackFit.expand, children: [
        Video(controller: controller, controls: (_) => const SizedBox.shrink()),
        Positioned(top: 0, left: 0, right: 0, child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black87, Colors.transparent])),
          child: Row(children: [
            IconButton(icon: const Icon(Icons.fullscreen_exit, color: Colors.white, size: 24), onPressed: onExit),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
          ]),
        )),
      ]),
    );
  }
}
