import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/di/service_locator.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/vod_bloc.dart';
import 'package:iptv_macos/features/series/presentation/bloc/series_bloc.dart';
import 'package:iptv_macos/features/player/presentation/bloc/player_bloc.dart';
import 'package:iptv_macos/features/home/presentation/pages/home_page.dart';
import 'package:iptv_macos/features/catalog/presentation/pages/live_channels_page.dart';
import 'package:iptv_macos/features/catalog/presentation/pages/vod_list_page.dart';
import 'package:iptv_macos/features/series/presentation/pages/series_list_page.dart';
import 'package:iptv_macos/features/settings/presentation/pages/settings_page.dart';
import 'package:iptv_macos/features/player/presentation/pages/player_page_mac.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key});
  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  /// null = home, 'live' / 'vod' / 'series' / 'settings' = inner page
  String? _currentPage;

  // Player state
  bool _isPlayerOpen = false;
  int? _playerStreamId;
  String? _playerContentType;
  String? _playerTitle;
  final String _playerExtension = 'm3u8';

  void _navigate(String page) => setState(() => _currentPage = page);
  void _goHome() => setState(() => _currentPage = null);

  void _closePlayer() => setState(() => _isPlayerOpen = false);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CatalogBloc(sl.getCategoriesUseCase, sl.getChannelsUseCase)),
        BlocProvider(create: (_) => VodBloc(sl.getVodListUseCase, sl.getVodDetailUseCase, sl.getCategoriesUseCase)),
        BlocProvider(create: (_) => SeriesBloc(sl.getSeriesUseCase, sl.getSeriesCategoriesUseCase, sl.getSeriesInfoUseCase)),
        BlocProvider(create: (_) => PlayerBloc(sl.getPlaySessionUseCase, sl.analyticsService)),
      ],
      child: Scaffold(
        body: _isPlayerOpen
            ? PlayerPageMac(
                streamId: _playerStreamId!,
                contentType: _playerContentType!,
                containerExtension: _playerExtension,
                title: _playerTitle,
                onBack: _closePlayer,
              )
            : AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: _buildCurrentPage(),
              ),
      ),
    );
  }

  Widget _buildCurrentPage() {
    switch (_currentPage) {
      case 'live':
        return LiveChannelsPage(key: const ValueKey('live'), onBack: _goHome);
      case 'vod':
        return VodListPage(key: const ValueKey('vod'), onBack: _goHome);
      case 'series':
        return SeriesListPage(key: const ValueKey('series'), onBack: _goHome);
      case 'settings':
        return SettingsPage(key: const ValueKey('settings'), onBack: _goHome);
      default:
        return HomePage(
          key: const ValueKey('home'),
          onNavigate: (page) => _navigate(page),
          onSettings: () => _navigate('settings'),
        );
    }
  }
}
