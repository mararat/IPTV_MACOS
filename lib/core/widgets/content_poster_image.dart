import 'package:flutter/material.dart';

class ContentPosterImage extends StatelessWidget {
  const ContentPosterImage({
    super.key,
    required this.imageUrl,
    required this.fallbackIcon,
    this.fit = BoxFit.cover,
    this.iconSize = 40,
    this.iconColor,
  });

  final String? imageUrl;
  final IconData fallbackIcon;
  final BoxFit fit;
  final double iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = iconColor ?? colorScheme.primary;

    final url = imageUrl?.trim() ?? '';
    if (url.isEmpty || (!url.startsWith('http://') && !url.startsWith('https://'))) {
      return _fallback(colorScheme, color);
    }

    return Image.network(
      url,
      fit: fit,
      width: double.infinity,
      headers: const {'User-Agent': 'Mozilla/5.0'},
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: colorScheme.surfaceContainerHighest,
          child: Center(
            child: SizedBox(
              width: 16, height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: color.withAlpha(100),
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          ),
        );
      },
      errorBuilder: (_, __, ___) => _fallback(colorScheme, color),
    );
  }

  Widget _fallback(ColorScheme colorScheme, Color color) {
    return Container(
      color: colorScheme.surfaceContainerHighest,
      child: Center(child: Icon(fallbackIcon, size: iconSize, color: color)),
    );
  }
}
