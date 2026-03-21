import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, this.onBack});
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Top bar
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: cs.surface,
            border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(50))),
          ),
          child: Row(
            children: [
              if (onBack != null)
                IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 20), onPressed: onBack, tooltip: 'Ana Sayfa'),
              Text('Ayarlar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: cs.onSurface)),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: ListView(
                    padding: const EdgeInsets.all(32),
                    children: [
                      Card(
                        child: SwitchListTile(
                          title: const Text('Karanlık Mod'),
                          subtitle: const Text('Arayüz temasını değiştir'),
                          value: state.isDarkMode,
                          onChanged: (_) => context.read<SettingsCubit>().toggleTheme(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        child: ListTile(
                          title: const Text('Uygulama Hakkında'),
                          subtitle: const Text('IPTV Player macOS v1.0.0'),
                          leading: const Icon(Icons.info_outline),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
