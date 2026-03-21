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
  mk.Player? _player;
  VideoController? _videoController;
  ChannelEntity? _activeChannel;
  bool _isFullscreen = false;
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
    _player?.dispose();
    super.dispose();
  }

  void _computeCounts(List<ChannelEntity> channels) {
    final counts = <String, int>{};
    for (final ch in channels) {
      final cid = ch.categoryId ?? '';
      counts[cid] = (counts[cid] ?? 0) + 1;
    }
    if (mounted) setState(() => _catCounts = counts);
  }

  void _playChannel(ChannelEntity channel) {
    if (_activeChannel?.id == channel.id) return;
    _player?.dispose();

    final url = sl.xtreamApi.liveStreamUrl(channel.streamId);
    _player = mk.Player(configuration: const mk.PlayerConfiguration(bufferSize: 32 * 1024 * 1024, logLevel: mk.MPVLogLevel.warn));
    _videoController = VideoController(_player!);
    _player!.open(mk.Media(url));
    _player!.setVolume(100);

    setState(() { _activeChannel = channel; _isFullscreen = false; });
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
        if (_isFullscreen && _videoController != null) {
          return _FullscreenPlayer(
            controller: _videoController!,
            channelName: _activeChannel!.name,
            onExit: () => setState(() => _isFullscreen = false),
          );
        }

        return Column(
          children: [
            // Top bar
            Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(color: cs.surface, border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(40)))),
              child: Row(
                children: [
                  if (widget.onBack != null) IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 20), onPressed: widget.onBack),
                  Text('Canlı TV', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: cs.onSurface)),
                  const SizedBox(width: 14),
                  SizedBox(
                    width: 200, height: 30,
                    child: TextField(
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(hintText: 'Ara...', prefixIcon: const Icon(Icons.search, size: 16), isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 6),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50)))),
                      onChanged: (q) => context.read<CatalogBloc>().add(CatalogEvent.searchChannels(query: q)),
                    ),
                  ),
                  const Spacer(),
                  if (state.channels.isNotEmpty) Text('${state.channels.length} kanal', style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
                ],
              ),
            ),
            // Body: sidebar + channel list + player
            Expanded(
              child: Row(
                children: [
                  // Category sidebar
                  _CategorySidebar(state: state, catCounts: _catCounts),
                  // Channel list (sütun)
                  SizedBox(
                    width: 260,
                    child: Container(
                      decoration: BoxDecoration(border: Border(right: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
                      child: _buildChannelList(state, cs),
                    ),
                  ),
                  // Right: Player area
                  Expanded(child: _buildPlayerArea(cs)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildChannelList(CatalogState state, ColorScheme cs) {
    if (state.isLoadingChannels && state.channels.isEmpty) return const LoadingWidget();
    if (state.errorMessage != null && state.channels.isEmpty) {
      return AppErrorWidget(message: state.errorMessage!, onRetry: () => context.read<CatalogBloc>().add(const CatalogEvent.loadChannels()));
    }
    if (state.channels.isEmpty) return const EmptyStateWidget(message: 'Kanal bulunamadı', icon: Icons.live_tv_outlined);

    return ListView.builder(
      itemCount: state.channels.length,
      itemBuilder: (_, i) {
        final ch = state.channels[i];
        final isActive = _activeChannel?.id == ch.id;
        return _ChannelListTile(channel: ch, isActive: isActive, onTap: () => _playChannel(ch));
      },
    );
  }

  Widget _buildPlayerArea(ColorScheme cs) {
    if (_activeChannel == null || _videoController == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.live_tv_rounded, size: 64, color: cs.onSurfaceVariant.withAlpha(60)),
            const SizedBox(height: 16),
            Text('Bir kanal seçin', style: TextStyle(fontSize: 15, color: cs.onSurfaceVariant.withAlpha(120))),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Player
        Expanded(
          child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Video(controller: _videoController!, controls: (_) => const SizedBox.shrink()),
                // Top overlay
                Positioned(
                  top: 0, left: 0, right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black54, Colors.transparent])),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(color: AppColors.live, borderRadius: BorderRadius.circular(4)),
                          child: const Text('CANLI', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 10),
                        Expanded(child: Text(_activeChannel!.name, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis)),
                        IconButton(icon: const Icon(Icons.fullscreen, color: Colors.white, size: 22), tooltip: 'Tam Ekran', onPressed: () => setState(() => _isFullscreen = true)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // EPG / Now playing info
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(color: cs.surfaceContainerHighest.withAlpha(80), border: Border(top: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
          child: Row(
            children: [
              if (_activeChannel!.logoUrl != null && _activeChannel!.logoUrl!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(width: 36, height: 36, child: ContentPosterImage(imageUrl: _activeChannel!.logoUrl, fallbackIcon: Icons.tv, fit: BoxFit.contain, iconSize: 20)),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_activeChannel!.name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: cs.onSurface)),
                    Text('Canlı Yayın', style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, size: 18, color: cs.onSurfaceVariant),
                tooltip: 'Kapat',
                onPressed: () { _player?.dispose(); _player = null; _videoController = null; setState(() => _activeChannel = null); },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Category Sidebar ──
class _CategorySidebar extends StatelessWidget {
  const _CategorySidebar({required this.state, required this.catCounts});
  final CatalogState state;
  final Map<String, int> catCounts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(color: AppColors.primary, border: Border(right: BorderSide(color: AppColors.primaryDark))),
      child: Column(
        children: [
          _CatTile(label: 'Tümü', count: null, isSelected: state.selectedCategoryId == null,
            onTap: () => context.read<CatalogBloc>().add(const CatalogEvent.loadChannels())),
          Divider(height: 1, color: Colors.white.withAlpha(20)),
          Expanded(
            child: ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (_, i) {
                final cat = state.categories[i];
                return _CatTile(
                  label: cat.name, count: catCounts[cat.id],
                  isSelected: cat.id == state.selectedCategoryId,
                  onTap: () => context.read<CatalogBloc>().add(CatalogEvent.loadChannels(categoryId: cat.id)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CatTile extends StatelessWidget {
  const _CatTile({required this.label, this.count, required this.isSelected, required this.onTap});
  final String label; final int? count; final bool isSelected; final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? Colors.white.withAlpha(25) : Colors.transparent,
      child: InkWell(
        onTap: onTap, hoverColor: Colors.white.withAlpha(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(border: Border(left: BorderSide(color: isSelected ? Colors.white : Colors.transparent, width: 3))),
          child: Row(
            children: [
              Expanded(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400, color: isSelected ? Colors.white : Colors.white.withAlpha(200)))),
              if (count != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(color: Colors.white.withAlpha(18), borderRadius: BorderRadius.circular(4)),
                  child: Text('$count', style: TextStyle(fontSize: 10, color: Colors.white.withAlpha(170))),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Channel List Tile ──
class _ChannelListTile extends StatefulWidget {
  const _ChannelListTile({required this.channel, required this.isActive, required this.onTap});
  final ChannelEntity channel; final bool isActive; final VoidCallback onTap;
  @override
  State<_ChannelListTile> createState() => _ChannelListTileState();
}

class _ChannelListTileState extends State<_ChannelListTile> {
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: widget.isActive ? cs.primaryContainer.withAlpha(120) : (_hovered ? cs.surfaceContainerHighest.withAlpha(60) : Colors.transparent),
            border: Border(
              left: BorderSide(color: widget.isActive ? cs.primary : Colors.transparent, width: 3),
              bottom: BorderSide(color: cs.outlineVariant.withAlpha(20)),
            ),
          ),
          child: Row(
            children: [
              // Logo
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  width: 36, height: 36,
                  child: ContentPosterImage(imageUrl: widget.channel.logoUrl, fallbackIcon: Icons.tv, fit: BoxFit.contain, iconSize: 18),
                ),
              ),
              const SizedBox(width: 10),
              // Name
              Expanded(
                child: Text(widget.channel.name, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400, color: widget.isActive ? cs.primary : cs.onSurface)),
              ),
              // Play icon on hover
              if (_hovered || widget.isActive)
                Icon(widget.isActive ? Icons.play_circle_filled : Icons.play_circle_outline, size: 18, color: widget.isActive ? cs.primary : cs.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Fullscreen Player ──
class _FullscreenPlayer extends StatelessWidget {
  const _FullscreenPlayer({required this.controller, required this.channelName, required this.onExit});
  final VideoController controller; final String channelName; final VoidCallback onExit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Video(controller: controller, controls: (_) => const SizedBox.shrink()),
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black87, Colors.transparent])),
              child: Row(
                children: [
                  IconButton(icon: const Icon(Icons.fullscreen_exit, color: Colors.white, size: 24), onPressed: onExit),
                  const SizedBox(width: 8),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: AppColors.live, borderRadius: BorderRadius.circular(4)),
                    child: const Text('CANLI', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
                  const SizedBox(width: 12),
                  Text(channelName, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
