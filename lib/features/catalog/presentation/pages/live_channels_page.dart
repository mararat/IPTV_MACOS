import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    final bloc = context.read<CatalogBloc>();
    if (bloc.state.categories.isEmpty) {
      bloc..add(const CatalogEvent.loadCategories())..add(const CatalogEvent.loadChannels());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        return Column(
          children: [
            // Top bar
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: cs.surface,
                border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(50))),
              ),
              child: Row(
                children: [
                  if (widget.onBack != null)
                    IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 20), onPressed: widget.onBack, tooltip: 'Ana Sayfa'),
                  Text('Canlı TV', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: cs.onSurface)),
                  const SizedBox(width: 20),
                  // Search
                  SizedBox(
                    width: 260,
                    height: 36,
                    child: TextField(
                      style: const TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        hintText: 'Kanal ara...',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(60))),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(60))),
                      ),
                      onChanged: (q) {
                        setState(() => _searchQuery = q);
                        context.read<CatalogBloc>().add(CatalogEvent.searchChannels(query: q));
                      },
                    ),
                  ),
                  const Spacer(),
                  if (state.channels.isNotEmpty)
                    Text('${state.channels.length} kanal', style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
                ],
              ),
            ),
            // Body
            Expanded(
              child: Row(
                children: [
                  // Category sidebar
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      border: Border(right: BorderSide(color: AppColors.primaryDark)),
                    ),
                    child: Column(
                      children: [
                        _CategoryTile(label: 'Tumu', isSelected: state.selectedCategoryId == null, onTap: () => context.read<CatalogBloc>().add(const CatalogEvent.loadChannels())),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.categories.length,
                            itemBuilder: (context, i) {
                              final cat = state.categories[i];
                              return _CategoryTile(
                                label: cat.name,
                                isSelected: cat.id == state.selectedCategoryId,
                                onTap: () => context.read<CatalogBloc>().add(CatalogEvent.loadChannels(categoryId: cat.id)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Channel grid
                  Expanded(
                    child: _buildContent(state, cs),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContent(CatalogState state, ColorScheme cs) {
    if (state.isLoadingChannels && state.channels.isEmpty) {
      return const LoadingWidget(message: 'Kanallar yukleniyor...');
    }
    if (state.errorMessage != null && state.channels.isEmpty) {
      return AppErrorWidget(message: state.errorMessage!, onRetry: () => context.read<CatalogBloc>().add(const CatalogEvent.loadChannels()));
    }
    if (state.channels.isEmpty) {
      return const EmptyStateWidget(message: 'Kanal bulunamadi', icon: Icons.live_tv_outlined);
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180,
        childAspectRatio: 1.3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: state.channels.length,
      itemBuilder: (context, i) => _ChannelCard(channel: state.channels[i]),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.label, required this.isSelected, required this.onTap});
  final String label;
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(border: Border(left: BorderSide(color: isSelected ? Colors.white : Colors.transparent, width: 3))),
          child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400, color: isSelected ? Colors.white : Colors.white.withAlpha(200))),
        ),
      ),
    );
  }
}

class _ChannelCard extends StatefulWidget {
  const _ChannelCard({required this.channel});
  final ChannelEntity channel;
  @override
  State<_ChannelCard> createState() => _ChannelCardState();
}

class _ChannelCardState extends State<_ChannelCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // TODO: Navigate to player
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _hovered ? cs.primary.withAlpha(120) : cs.outlineVariant.withAlpha(50)),
            boxShadow: _hovered ? [BoxShadow(color: cs.primary.withAlpha(20), blurRadius: 12, offset: const Offset(0, 4))] : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ContentPosterImage(imageUrl: widget.channel.logoUrl, fallbackIcon: Icons.tv, fit: BoxFit.contain, iconSize: 32),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHighest.withAlpha(60),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                child: Text(widget.channel.name, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: cs.onSurface)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
