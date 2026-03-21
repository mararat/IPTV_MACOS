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
  @override
  void initState() {
    super.initState();
    final bloc = context.read<SeriesBloc>();
    if (bloc.state.seriesList.isEmpty) {
      bloc..add(const SeriesEvent.loadCategories())..add(const SeriesEvent.loadSeries());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocBuilder<SeriesBloc, SeriesState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: cs.surface, border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(50)))),
              child: Row(
                children: [
                  if (widget.onBack != null)
                    IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 20), onPressed: widget.onBack, tooltip: 'Ana Sayfa'),
                  Text('Diziler', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: cs.onSurface)),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 260, height: 36,
                    child: TextField(
                      style: const TextStyle(fontSize: 13),
                      decoration: InputDecoration(hintText: 'Dizi ara...', prefixIcon: const Icon(Icons.search, size: 20), isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(60))),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(60)))),
                      onChanged: (q) => context.read<SeriesBloc>().add(SeriesEvent.searchSeries(query: q)),
                    ),
                  ),
                  const Spacer(),
                  if (state.seriesList.isNotEmpty) Text('${state.seriesList.length} dizi', style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
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
                        _CatTile(label: 'Tumu', selected: state.selectedCategoryId == null, onTap: () => context.read<SeriesBloc>().add(const SeriesEvent.loadSeries())),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.categories.length,
                            itemBuilder: (_, i) {
                              final c = state.categories[i];
                              return _CatTile(label: c.name, selected: c.id == state.selectedCategoryId, onTap: () => context.read<SeriesBloc>().add(SeriesEvent.loadSeries(categoryId: c.id)));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: _grid(state, cs)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _grid(SeriesState state, ColorScheme cs) {
    if (state.isLoading && state.seriesList.isEmpty) return const LoadingWidget(message: 'Diziler yukleniyor...');
    if (state.errorMessage != null && state.seriesList.isEmpty) return AppErrorWidget(message: state.errorMessage!, onRetry: () => context.read<SeriesBloc>().add(const SeriesEvent.loadSeries()));
    if (state.seriesList.isEmpty) return const EmptyStateWidget(message: 'Dizi bulunamadi', icon: Icons.tv_outlined);

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 160, childAspectRatio: 0.55, mainAxisSpacing: 12, crossAxisSpacing: 12),
      itemCount: state.seriesList.length,
      itemBuilder: (_, i) {
        final s = state.seriesList[i];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(8), child: ContentPosterImage(imageUrl: s.cover, fallbackIcon: Icons.tv))),
            const SizedBox(height: 4),
            Text(s.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: cs.onSurface)),
          ],
        );
      },
    );
  }
}

class _CatTile extends StatelessWidget {
  const _CatTile({required this.label, required this.selected, required this.onTap});
  final String label; final bool selected; final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.white.withAlpha(25) : Colors.transparent,
      child: InkWell(onTap: onTap, hoverColor: Colors.white.withAlpha(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(border: Border(left: BorderSide(color: selected ? Colors.white : Colors.transparent, width: 3))),
          child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13, fontWeight: selected ? FontWeight.w600 : FontWeight.w400, color: selected ? Colors.white : Colors.white.withAlpha(200))),
        ),
      ),
    );
  }
}
