import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Text('Ayarlar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: cs.onSurface)),
            const SizedBox(height: 24),
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Karanlik Mod'),
                    subtitle: const Text('Arayuz temasini degistir'),
                    value: state.isDarkMode,
                    onChanged: (_) => context.read<SettingsCubit>().toggleTheme(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                title: const Text('Uygulama Hakkinda'),
                subtitle: const Text('IPTV Player macOS v1.0.0'),
                leading: const Icon(Icons.info_outline),
              ),
            ),
          ],
        );
      },
    );
  }
}
