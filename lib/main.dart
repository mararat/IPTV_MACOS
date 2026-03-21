import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:iptv_macos/core/config/env_config.dart';
import 'package:iptv_macos/core/di/service_locator.dart';
import 'package:iptv_macos/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  EnvConfig.initialize(flavor: 'dev');
  sl.init();
  runApp(const App());
}
