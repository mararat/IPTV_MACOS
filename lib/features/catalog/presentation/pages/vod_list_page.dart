import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  const VodListPage({super.key});
  @override
  State<VodListPage> createState() => _VodListPageState();
}

class _VodListPageState extends State<VodListPage> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<VodBloc>();
    if (bloc.state.vodList.isEmpty) {
      bloc..add(const VodEvent.loadCategories())..add(const VodEvent.loadVodList());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocBuilder<VodBloc, VodState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: cs.surface, border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(50)))),
              child: Row(
                children: [
                  Text('Filmler', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: cs.onSurface)),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 260, height: 36,
                    child: TextField(
                      style: const TextStyle(fontSize: 13),
                      decoration: InputDecoration(hintText: 'Film ara...', prefixIcon: const Icon(Icons.search, size: 20), isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(60))),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(60)))),
                      onChanged: (q) => context.read<VodBloc>().add(VodEvent.searchVod(query: q)),
                    ),
                  ),
                  const Spacer(),
                  if (state.vodList.isNotEmpty) Text('${state.vodList.length} film', style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
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
                        _CatTile(label: 'Tumu', selected: state.selectedCategoryId == null, onTap: () => context.read<VodBloc>().add(const VodEvent.loadVodList())),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.categories.length,
                            itemBuilder: (_, i) {
                              final c = state.categories[i];
                              return _CatTile(label: c.name, selected: c.id == state.selectedCategoryId, onTap: () => context.read<VodBloc>().add(VodEvent.loadVodList(categoryId: c.id)));
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

  Widget _grid(VodState state, ColorScheme cs) {
    if (state.isLoading && state.vodList.isEmpty) return const LoadingWidget(message: 'Filmler yukleniyor...');
    if (state.errorMessage != null && state.vodList.isEmpty) return AppErrorWidget(message: state.errorMessage!, onRetry: () => context.read<VodBloc>().add(const VodEvent.loadVodList()));
    if (state.vodList.isEmpty) return const EmptyStateWidget(message: 'Film bulunamadi', icon: Icons.movie_outlined);

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 160, childAspectRatio: 0.55, mainAxisSpacing: 12, crossAxisSpacing: 12),
      itemCount: state.vodList.length,
      itemBuilder: (_, i) {
        final v = state.vodList[i];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(8), child: ContentPosterImage(imageUrl: v.posterUrl, fallbackIcon: Icons.movie))),
            const SizedBox(height: 4),
            Text(v.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: cs.onSurface)),
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
