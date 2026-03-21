import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/di/service_locator.dart';
import 'package:iptv_macos/core/theme/app_colors.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:iptv_macos/features/catalog/presentation/bloc/vod_bloc.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_categories_usecase.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_channels_usecase.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_vod_list_usecase.dart';
import 'package:iptv_macos/features/catalog/domain/usecases/get_vod_detail_usecase.dart';
import 'package:iptv_macos/features/series/presentation/bloc/series_bloc.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_state.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_event.dart';
import 'package:iptv_macos/features/catalog/presentation/pages/live_channels_page.dart';
import 'package:iptv_macos/features/catalog/presentation/pages/vod_list_page.dart';
import 'package:iptv_macos/features/series/presentation/pages/series_list_page.dart';
import 'package:iptv_macos/features/settings/presentation/pages/settings_page.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key});
  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CatalogBloc(sl.getCategoriesUseCase, sl.getChannelsUseCase)),
        BlocProvider(create: (_) => VodBloc(sl.getVodListUseCase, sl.getVodDetailUseCase, sl.getCategoriesUseCase)),
        BlocProvider(create: (_) => SeriesBloc(sl.getSeriesUseCase, sl.getSeriesCategoriesUseCase, sl.getSeriesInfoUseCase)),
      ],
      child: Scaffold(
        body: Row(
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
                  const SizedBox(height: 16),
                  // App icon
                  Container(
                    width: 40, height: 40,
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(20),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.tv, color: Colors.white, size: 22),
                  ),
                  _NavItem(icon: Icons.live_tv, label: 'Canli', isSelected: _selectedIndex == 0, onTap: () => setState(() => _selectedIndex = 0)),
                  _NavItem(icon: Icons.movie_outlined, label: 'Film', isSelected: _selectedIndex == 1, onTap: () => setState(() => _selectedIndex = 1)),
                  _NavItem(icon: Icons.tv_outlined, label: 'Dizi', isSelected: _selectedIndex == 2, onTap: () => setState(() => _selectedIndex = 2)),
                  const Spacer(),
                  // Theme toggle
                  BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, s) => _NavItem(
                      icon: s.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                      label: '',
                      isSelected: false,
                      onTap: () => context.read<SettingsCubit>().toggleTheme(),
                    ),
                  ),
                  _NavItem(icon: Icons.settings, label: '', isSelected: _selectedIndex == 3, onTap: () => setState(() => _selectedIndex = 3)),
                  _NavItem(icon: Icons.logout, label: '', isSelected: false, onTap: () => context.read<AuthBloc>().add(const AuthEvent.logout())),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            // Content
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: const [
                  LiveChannelsPage(),
                  VodListPage(),
                  SeriesListPage(),
                  SettingsPage(),
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
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
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
                if (label.isNotEmpty) Text(label, style: TextStyle(fontSize: 10, color: isSelected ? Colors.white : Colors.white.withAlpha(160))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
