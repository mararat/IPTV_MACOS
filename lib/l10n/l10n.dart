import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class L10n {
  static const supportedLocales = [
    Locale('en'),
    Locale('tr'),
  ];

  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
