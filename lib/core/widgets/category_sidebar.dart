import 'package:flutter/material.dart';
import 'package:iptv_macos/core/theme/app_colors.dart';

class CategorySidebar extends StatelessWidget {
  const CategorySidebar({
    super.key,
    required this.categories,
    this.counts = const {},
    this.selectedId,
    required this.onSelected,
    this.allLabel = 'Tümü',
  });

  final List<({String id, String name})> categories;
  final Map<String, int> counts;
  final String? selectedId;
  final ValueChanged<String?> onSelected;
  final String allLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border(right: BorderSide(color: AppColors.primaryDark)),
      ),
      child: Column(children: [
        _CatTile(label: allLabel, count: null, selected: selectedId == null, onTap: () => onSelected(null)),
        Divider(height: 1, color: Colors.white.withAlpha(20)),
        Expanded(
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (_, i) {
              final cat = categories[i];
              return _CatTile(
                label: cat.name,
                count: counts[cat.id],
                selected: cat.id == selectedId,
                onTap: () => onSelected(cat.id),
              );
            },
          ),
        ),
      ]),
    );
  }
}

class _CatTile extends StatelessWidget {
  const _CatTile({required this.label, this.count, required this.selected, required this.onTap});
  final String label;
  final int? count;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.white.withAlpha(25) : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.white.withAlpha(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          decoration: BoxDecoration(border: Border(left: BorderSide(color: selected ? Colors.white : Colors.transparent, width: 3))),
          child: Row(children: [
            Expanded(
              child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, fontWeight: selected ? FontWeight.w600 : FontWeight.w400, color: selected ? Colors.white : Colors.white.withAlpha(200))),
            ),
            if (count != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(color: Colors.white.withAlpha(18), borderRadius: BorderRadius.circular(4)),
                child: Text('$count', style: TextStyle(fontSize: 10, color: Colors.white.withAlpha(170))),
              ),
          ]),
        ),
      ),
    );
  }
}
