import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/theme/app_colors.dart';
import 'package:iptv_macos/core/widgets/content_poster_image.dart';
import 'package:iptv_macos/core/widgets/empty_state_widget.dart';
import 'package:iptv_macos/core/widgets/error_widget.dart';
import 'package:iptv_macos/core/widgets/loading_widget.dart';
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

  @override
  void initState() {
    super.initState();
    final bloc = context.read<SeriesBloc>();
    if (bloc.state.seriesList.isEmpty) {
      bloc..add(const SeriesEvent.loadCategories())..add(const SeriesEvent.loadSeries());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _computeCounts(List items) {
    final counts = <String, int>{};
    for (final s in items) {
      final cid = s.categoryId?.toString() ?? '';
      counts[cid] = (counts[cid] ?? 0) + 1;
    }
    if (mounted) setState(() => _catCounts = counts);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocConsumer<SeriesBloc, SeriesState>(
      listener: (context, state) {
        if (!state.isLoading && state.seriesList.isNotEmpty && _catCounts.isEmpty && state.selectedCategoryId == null) {
          _computeCounts(state.seriesList);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(color: cs.surface, border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(40)))),
              child: Row(
                children: [
                  if (widget.onBack != null) IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 20), onPressed: widget.onBack),
                  Text('Diziler', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: cs.onSurface)),
                  const Spacer(),
                  if (state.seriesList.isNotEmpty) Text('${state.seriesList.length} dizi', style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
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
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
                          child: TextField(
                            controller: _searchController,
                            style: const TextStyle(fontSize: 12),
                            decoration: InputDecoration(hintText: 'Dizi ara...', prefixIcon: const Icon(Icons.search, size: 18), isDense: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 8),
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
              ),
            ),
          ],
        );
      },
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
        return _SeriesCard(series: s);
      },
    );
  }
}

class _SeriesCard extends StatefulWidget {
  const _SeriesCard({required this.series});
  final dynamic series;
  @override
  State<_SeriesCard> createState() => _SeriesCardState();
}

class _SeriesCardState extends State<_SeriesCard> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final s = widget.series;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(fit: StackFit.expand, children: [
                ClipRRect(borderRadius: BorderRadius.circular(8), child: ContentPosterImage(imageUrl: s.cover, fallbackIcon: Icons.tv)),
                if (_hovered)
                  Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black38),
                    child: const Center(child: Icon(Icons.info_outline, color: Colors.white, size: 32))),
                if (s.rating != null && s.rating! > 0)
                  Positioned(top: 4, right: 4, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 12),
                      const SizedBox(width: 2),
                      Text(s.rating!.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600)),
                    ]),
                  )),
              ]),
            ),
            const SizedBox(height: 4),
            Text(s.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: cs.onSurface)),
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
