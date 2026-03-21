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
import 'package:iptv_macos/features/catalog/domain/entities/channel_entity.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/catalog_event.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/catalog_state.dart';

class LiveChannelsPage extends StatefulWidget {
  const LiveChannelsPage({super.key, this.onBack});
  final VoidCallback? onBack;
  @override
  State<LiveChannelsPage> createState() => _LiveChannelsPageState();
}

class _LiveChannelsPageState extends State<LiveChannelsPage> {
  // Preview player
  mk.Player? _player;
  VideoController? _videoController;
  ChannelEntity? _activeChannel;
  bool _isFullscreen = false;
  final List<StreamSubscription<dynamic>> _subs = [];

  // Category counts
  Map<String, int> _catCounts = {};

  @override
  void initState() {
    super.initState();
    final bloc = context.read<CatalogBloc>();
    if (bloc.state.categories.isEmpty) {
      bloc..add(const CatalogEvent.loadCategories())..add(const CatalogEvent.loadChannels());
    }
  }

  @override
  void dispose() {
    for (final s in _subs) s.cancel();
    _player?.dispose();
    super.dispose();
  }

  void _computeCounts(List<ChannelEntity> channels) {
    final counts = <String, int>{};
    for (final ch in channels) {
      final cid = ch.categoryId ?? '';
      counts[cid] = (counts[cid] ?? 0) + 1;
    }
    setState(() => _catCounts = counts);
  }

  void _playChannel(ChannelEntity channel) {
    if (_activeChannel?.id == channel.id) return;

    // Dispose old player
    for (final s in _subs) s.cancel();
    _subs.clear();
    _player?.dispose();

    final url = sl.xtreamApi.liveStreamUrl(channel.streamId);

    _player = mk.Player(
      configuration: const mk.PlayerConfiguration(
        bufferSize: 32 * 1024 * 1024,
        logLevel: mk.MPVLogLevel.warn,
      ),
    );
    _videoController = VideoController(_player!);

    _player!.open(mk.Media(url));
    _player!.setVolume(100);

    setState(() {
      _activeChannel = channel;
      _isFullscreen = false;
    });
  }

  void _toggleFullscreen() {
    setState(() => _isFullscreen = !_isFullscreen);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocConsumer<CatalogBloc, CatalogState>(
      listener: (context, state) {
        if (!state.isLoadingChannels && state.channels.isNotEmpty && _catCounts.isEmpty && state.selectedCategoryId == null) {
          _computeCounts(state.channels);
        }
      },
      builder: (context, state) {
        // Fullscreen player
        if (_isFullscreen && _videoController != null && _activeChannel != null) {
          return _buildFullscreenPlayer(cs);
        }

        return Column(
          children: [
            // Top bar
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: cs.surface,
                border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(40))),
              ),
              child: Row(
                children: [
                  if (widget.onBack != null)
                    IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 20), onPressed: widget.onBack, tooltip: 'Ana Sayfa'),
                  Text('Canlı TV', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: cs.onSurface)),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 220,
                    height: 32,
                    child: TextField(
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        hintText: 'Kanal ara...',
                        prefixIcon: const Icon(Icons.search, size: 18),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 6),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
                      ),
                      onChanged: (q) => context.read<CatalogBloc>().add(CatalogEvent.searchChannels(query: q)),
                    ),
                  ),
                  const Spacer(),
                  if (state.channels.isNotEmpty)
                    Text('${state.channels.length} kanal', style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
                ],
              ),
            ),
            // Body
            Expanded(
              child: Row(
                children: [
                  // Category sidebar
                  Container(
                    width: 190,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      border: Border(right: BorderSide(color: AppColors.primaryDark)),
                    ),
                    child: Column(
                      children: [
                        _CatTile(
                          label: 'Tümü',
                          count: state.channels.length,
                          isSelected: state.selectedCategoryId == null,
                          onTap: () => context.read<CatalogBloc>().add(const CatalogEvent.loadChannels()),
                        ),
                        Divider(height: 1, color: Colors.white.withAlpha(20)),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.categories.length,
                            itemBuilder: (_, i) {
                              final cat = state.categories[i];
                              return _CatTile(
                                label: cat.name,
                                count: _catCounts[cat.id],
                                isSelected: cat.id == state.selectedCategoryId,
                                onTap: () => context.read<CatalogBloc>().add(CatalogEvent.loadChannels(categoryId: cat.id)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Right side: channels + preview player
                  Expanded(
                    child: Column(
                      children: [
                        // Channel grid (top half or full if no player)
                        Expanded(
                          flex: _activeChannel != null ? 1 : 1,
                          child: _buildChannelGrid(state, cs),
                        ),
                        // Preview player (bottom half)
                        if (_activeChannel != null && _videoController != null)
                          Container(
                            height: MediaQuery.of(context).size.height * 0.45,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border(top: BorderSide(color: cs.outlineVariant.withAlpha(40))),
                            ),
                            child: Stack(
                              children: [
                                Video(controller: _videoController!, controls: (_) => const SizedBox.shrink()),
                                // Controls overlay
                                Positioned(
                                  top: 0, left: 0, right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black54, Colors.transparent]),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(color: AppColors.live, borderRadius: BorderRadius.circular(4)),
                                          child: const Text('CANLI', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            _activeChannel!.name,
                                            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                                            maxLines: 1, overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.close, color: Colors.white70, size: 18),
                                          tooltip: 'Kapat',
                                          onPressed: () {
                                            _player?.dispose();
                                            _player = null;
                                            _videoController = null;
                                            setState(() => _activeChannel = null);
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.fullscreen, color: Colors.white, size: 22),
                                          tooltip: 'Tam Ekran',
                                          onPressed: _toggleFullscreen,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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

  Widget _buildChannelGrid(CatalogState state, ColorScheme cs) {
    if (state.isLoadingChannels && state.channels.isEmpty) {
      return const LoadingWidget(message: 'Kanallar yükleniyor...');
    }
    if (state.errorMessage != null && state.channels.isEmpty) {
      return AppErrorWidget(message: state.errorMessage!, onRetry: () => context.read<CatalogBloc>().add(const CatalogEvent.loadChannels()));
    }
    if (state.channels.isEmpty) {
      return const EmptyStateWidget(message: 'Kanal bulunamadı', icon: Icons.live_tv_outlined);
    }

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 160,
        childAspectRatio: 1.3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: state.channels.length,
      itemBuilder: (_, i) {
        final ch = state.channels[i];
        final isActive = _activeChannel?.id == ch.id;
        return _ChannelCard(
          channel: ch,
          isActive: isActive,
          onTap: () => _playChannel(ch),
        );
      },
    );
  }

  Widget _buildFullscreenPlayer(ColorScheme cs) {
    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Video(controller: _videoController!, controls: (_) => const SizedBox.shrink()),
          // Top bar
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black87, Colors.transparent]),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.fullscreen_exit, color: Colors.white, size: 24),
                    tooltip: 'Küçült',
                    onPressed: _toggleFullscreen,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: AppColors.live, borderRadius: BorderRadius.circular(4)),
                    child: const Text('CANLI', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 12),
                  Text(_activeChannel!.name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Category Tile ──
class _CatTile extends StatelessWidget {
  const _CatTile({required this.label, this.count, required this.isSelected, required this.onTap});
  final String label;
  final int? count;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? Colors.white.withAlpha(25) : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.white.withAlpha(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: isSelected ? Colors.white : Colors.transparent, width: 3)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400, color: isSelected ? Colors.white : Colors.white.withAlpha(200))),
              ),
              if (count != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                  decoration: BoxDecoration(color: Colors.white.withAlpha(20), borderRadius: BorderRadius.circular(4)),
                  child: Text('$count', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.white.withAlpha(180))),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Channel Card ──
class _ChannelCard extends StatefulWidget {
  const _ChannelCard({required this.channel, required this.isActive, required this.onTap});
  final ChannelEntity channel;
  final bool isActive;
  final VoidCallback onTap;
  @override
  State<_ChannelCard> createState() => _ChannelCardState();
}

class _ChannelCardState extends State<_ChannelCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isActive = widget.isActive;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: isActive ? cs.primaryContainer : cs.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isActive ? cs.primary : (_hovered ? cs.primary.withAlpha(100) : cs.outlineVariant.withAlpha(40)),
              width: isActive ? 2 : 1,
            ),
            boxShadow: _hovered ? [BoxShadow(color: cs.primary.withAlpha(15), blurRadius: 8, offset: const Offset(0, 3))] : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ContentPosterImage(imageUrl: widget.channel.logoUrl, fallbackIcon: Icons.tv, fit: BoxFit.contain, iconSize: 28),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive ? cs.primary.withAlpha(30) : cs.surfaceContainerHighest.withAlpha(50),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                ),
                child: Text(widget.channel.name, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: isActive ? cs.primary : cs.onSurface)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
