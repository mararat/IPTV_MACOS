import 'package:flutter/material.dart';

/// Centralized color tokens for the entire app.
/// All colors derive from the brand primary #003865.
class AppColors {
  const AppColors._();

  // ─── Brand ────────────────────────────────────
  static const Color primary = Color(0xFF003865);
  static const Color primaryLight = Color(0xFF1A5C87);
  static const Color primaryDark = Color(0xFF002244);

  // ─── Secondary / Tertiary ─────────────────────
  static const Color secondary = Color(0xFF3D6B8E);
  static const Color tertiary = Color(0xFF5A9FBF);

  // ─── Category Accents (home cards, history icons) ─
  static const Color liveAccent = Color(0xFFC0392B);
  static const Color vodAccent = Color(0xFF1A5276);
  static const Color seriesAccent = Color(0xFF117A65);
  static const Color continueAccent = Color(0xFFD4880F);

  // ─── Surfaces ─────────────────────────────────
  static const Color backgroundLight = Color(0xFFF6F8FA);
  static const Color backgroundDark = Color(0xFF0D1B2A);

  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1B2838);

  // ─── Status / Semantic ────────────────────────
  static const Color error = Color(0xFFC0392B);
  static const Color success = Color(0xFF1B7A3D);
  static const Color warning = Color(0xFFD4880F);
  static const Color info = Color(0xFF2471A3);

  // ─── Content Badges ───────────────────────────
  static const Color live = Color(0xFFE53935);
  static const Color star = Color(0xFFFFC107);
  static const Color trial = Color(0xFFD4880F);
}
