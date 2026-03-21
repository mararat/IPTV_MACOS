import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/di/service_locator.dart';
import 'package:iptv_macos/core/theme/app_colors.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/vod_bloc.dart';
import 'package:iptv_macos/features/series/presentation/bloc/series_bloc.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_state.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_event.dart';
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
  int _selectedIndex = 0;

  // Player state
  bool _isPlayerOpen = false;
  int? _playerStreamId;
  String? _playerContentType;
  String? _playerTitle;
  String _playerExtension = 'm3u8';

  void _openPlayer({required int streamId, required String contentType, String? title, String extension = 'm3u8'}) {
    setState(() {
      _isPlayerOpen = true;
      _playerStreamId = streamId;
      _playerContentType = contentType;
      _playerTitle = title;
      _playerExtension = extension;
    });
  }

  void _closePlayer() {
    setState(() => _isPlayerOpen = false);
  }

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
            : Row(
                children: [
                  // Navigation Rail
                  Container(
                    width: 72,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      border: Border(right: BorderSide(color: AppColors.primaryDark)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        _NavItem(icon: Icons.home_rounded, label: 'Ana Sayfa', isSelected: _selectedIndex == 0, onTap: () => setState(() => _selectedIndex = 0)),
                        const SizedBox(height: 4),
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 14), child: Divider(height: 1, color: Colors.white.withAlpha(25))),
                        const SizedBox(height: 4),
                        _NavItem(icon: Icons.live_tv, label: 'Canlı', isSelected: _selectedIndex == 1, onTap: () => setState(() => _selectedIndex = 1)),
                        _NavItem(icon: Icons.movie_outlined, label: 'Film', isSelected: _selectedIndex == 2, onTap: () => setState(() => _selectedIndex = 2)),
                        _NavItem(icon: Icons.tv_outlined, label: 'Dizi', isSelected: _selectedIndex == 3, onTap: () => setState(() => _selectedIndex = 3)),
                        const Spacer(),
                        BlocBuilder<SettingsCubit, SettingsState>(
                          builder: (context, s) => _NavItem(
                            icon: s.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                            label: '',
                            isSelected: false,
                            onTap: () => context.read<SettingsCubit>().toggleTheme(),
                          ),
                        ),
                        _NavItem(icon: Icons.settings, label: '', isSelected: _selectedIndex == 4, onTap: () => setState(() => _selectedIndex = 4)),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  // Content
                  Expanded(
                    child: IndexedStack(
                      index: _selectedIndex,
                      children: [
                        HomePage(onNavigate: (i) => setState(() => _selectedIndex = i)),
                        const LiveChannelsPage(),
                        const VodListPage(),
                        const SeriesListPage(),
                        const SettingsPage(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label, required this.isSelected, required this.onTap});
  final IconData icon; final String label; final bool isSelected; final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          hoverColor: Colors.white.withAlpha(15),
          child: Container(
            width: 52, height: 48,
            decoration: BoxDecoration(
              color: isSelected ? Colors.white.withAlpha(25) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 22, color: isSelected ? Colors.white : Colors.white.withAlpha(180)),
                if (label.isNotEmpty) Text(label, style: TextStyle(fontSize: 9, color: isSelected ? Colors.white : Colors.white.withAlpha(160))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
