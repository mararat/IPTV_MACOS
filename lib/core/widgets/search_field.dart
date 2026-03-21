import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = 'Ara...',
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(30)))),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search, size: 18),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: cs.outlineVariant.withAlpha(50))),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(icon: const Icon(Icons.close, size: 16), onPressed: () { controller.clear(); onChanged(''); })
              : null,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
