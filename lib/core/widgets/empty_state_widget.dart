import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key, required this.message, this.icon});
  final String message;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, size: 56, color: cs.onSurfaceVariant.withAlpha(100)),
          const SizedBox(height: 16),
          Text(message, style: TextStyle(fontSize: 15, color: cs.onSurfaceVariant)),
        ],
      ),
    );
  }
}
