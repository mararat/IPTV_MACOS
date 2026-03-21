import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/di/service_locator.dart';
import 'package:iptv_macos/core/theme/app_colors.dart';
import 'package:iptv_macos/core/widgets/category_sidebar.dart';
import 'package:iptv_macos/core/widgets/content_poster_image.dart';
import 'package:iptv_macos/core/widgets/empty_state_widget.dart';
import 'package:iptv_macos/core/widgets/error_widget.dart';
import 'package:iptv_macos/core/widgets/loading_widget.dart';
import 'package:iptv_macos/core/widgets/player_overlay.dart';
import 'package:iptv_macos/core/widgets/search_field.dart';
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
  ChannelEntity? _activeChannel;
  bool _isFullscreen = false;
  Map<String, int> _catCounts = {};
  final _searchController = TextEditingController();

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
    _searchController.dispose();
    super.dispose();
  }

  void _computeCounts(List<ChannelEntity> channels) {
    final counts = <String, int>{};
    for (final ch in channels) {
      counts[ch.categoryId ?? ''] = (counts[ch.categoryId ?? ''] ?? 0) + 1;
    }
    if (mounted) setState(() => _catCounts = counts);
  }

  void _playChannel(ChannelEntity channel) {
    if (_activeChannel?.id == channel.id) return;
    setState(() { _activeChannel = channel; _isFullscreen = false; });
  }

  void _stopPlayer() {
    setState(() => _activeChannel = null);
  }

  Widget _buildCanliTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(color: AppColors.live, borderRadius: BorderRadius.circular(4)),
      child: const Text('CANLI', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
    );
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
        if (_isFullscreen && _activeChannel != null) {
          return _buildFullscreenPlayer(cs);
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
                  CategorySidebar(
                    categories: state.categories.map((c) => (id: c.id, name: c.name)).toList(),
                    counts: _catCounts,
                    selectedId: state.selectedCategoryId,
                    onSelected: (id) {
                      if (id == null) {
                        context.read<CatalogBloc>().add(const CatalogEvent.loadChannels());
                      } else {
                        context.read<CatalogBloc>().add(CatalogEvent.loadChannels(categoryId: id));
                      }
                    },
                  ),
                  // Channel list — wider with search
                  SizedBox(
                    width: 320,
                    child: Column(
                      children: [
                        // Search with right border
                        Container(
                          decoration: BoxDecoration(border: Border(right: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
                          child: SearchField(
                            controller: _searchController,
                            hintText: 'Kanal ara...',
                            onChanged: (q) {
                              context.read<CatalogBloc>().add(CatalogEvent.searchChannels(query: q));
                              setState(() {});
                            },
                          ),
                        ),
                        // List
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(border: Border(right: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
                            child: _buildChannelList(state, cs),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Player area
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: _buildPlayerArea(cs),
                    ),
                  )),
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
    if (state.errorMessage != null && state.channels.isEmpty) return AppErrorWidget(message: state.errorMessage!, onRetry: () => context.read<CatalogBloc>().add(const CatalogEvent.loadChannels()));
    if (state.channels.isEmpty) return const EmptyStateWidget(message: 'Kanal bulunamadı', icon: Icons.live_tv_outlined);

    return ListView.builder(
      itemCount: state.channels.length,
      itemBuilder: (_, i) {
        final ch = state.channels[i];
        return _ChannelTile(channel: ch, isActive: _activeChannel?.id == ch.id, onTap: () => _playChannel(ch));
      },
    );
  }

  Widget _buildPlayerArea(ColorScheme cs) {
    if (_activeChannel == null) {
      return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.live_tv_rounded, size: 64, color: cs.onSurfaceVariant.withAlpha(50)),
          const SizedBox(height: 16),
          Text('Bir kanal seçin', style: TextStyle(fontSize: 15, color: cs.onSurfaceVariant.withAlpha(100))),
        ]),
      );
    }

    final url = sl.xtreamApi.liveStreamUrl(_activeChannel!.streamId);

    return Column(
      children: [
        // Video player
        Expanded(
          child: InlinePlayer(
            url: url,
            title: _activeChannel!.name,
            isLive: true,
            topExtra: _buildCanliTag(),
            bufferSize: 32 * 1024 * 1024,
            onFullscreen: () => setState(() => _isFullscreen = true),
            onClose: _stopPlayer,
          ),
        ),
        // Now playing info bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(color: cs.surfaceContainerHighest.withAlpha(80), border: Border(top: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
          child: Row(
            children: [
              if (_activeChannel!.logoUrl != null && _activeChannel!.logoUrl!.isNotEmpty)
                ClipRRect(borderRadius: BorderRadius.circular(6), child: SizedBox(width: 32, height: 32, child: ContentPosterImage(imageUrl: _activeChannel!.logoUrl, fallbackIcon: Icons.tv, fit: BoxFit.contain, iconSize: 18))),
              const SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(_activeChannel!.name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: cs.onSurface)),
                Text('Canlı Yayın', style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
              ])),
              IconButton(icon: Icon(Icons.stop_circle_outlined, size: 20, color: cs.error), tooltip: 'Durdur', onPressed: _stopPlayer),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFullscreenPlayer(ColorScheme cs) {
    final url = sl.xtreamApi.liveStreamUrl(_activeChannel!.streamId);

    return InlinePlayer(
      url: url,
      title: _activeChannel!.name,
      isLive: true,
      topExtra: _buildCanliTag(),
      bufferSize: 32 * 1024 * 1024,
      onFullscreen: () => setState(() => _isFullscreen = false),
      onClose: () => setState(() => _isFullscreen = false),
    );
  }
}

// ── Widgets ──

class _ChannelTile extends StatefulWidget {
  const _ChannelTile({required this.channel, required this.isActive, required this.onTap});
  final ChannelEntity channel; final bool isActive; final VoidCallback onTap;
  @override
  State<_ChannelTile> createState() => _ChannelTileState();
}

class _ChannelTileState extends State<_ChannelTile> {
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: widget.isActive ? cs.primaryContainer.withAlpha(120) : (_hovered ? cs.surfaceContainerHighest.withAlpha(60) : Colors.transparent),
            border: Border(left: BorderSide(color: widget.isActive ? cs.primary : Colors.transparent, width: 3), bottom: BorderSide(color: cs.outlineVariant.withAlpha(15))),
          ),
          child: Row(children: [
            ClipRRect(borderRadius: BorderRadius.circular(6), child: SizedBox(width: 38, height: 38, child: ContentPosterImage(imageUrl: widget.channel.logoUrl, fallbackIcon: Icons.tv, fit: BoxFit.contain, iconSize: 18))),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(widget.channel.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13, fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400, color: widget.isActive ? cs.primary : cs.onSurface)),
              if (widget.channel.epgChannelId != null && widget.channel.epgChannelId!.isNotEmpty)
                Text(widget.channel.epgChannelId!, maxLines: 1, style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
            ])),
            if (_hovered || widget.isActive) Icon(widget.isActive ? Icons.play_circle_filled : Icons.play_circle_outline, size: 20, color: widget.isActive ? cs.primary : cs.onSurfaceVariant),
          ]),
        ),
      ),
    );
  }
}
