import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_event.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_state.dart';
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
              final cubit = context.read<SettingsCubit>();

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: ListView(
                    padding: const EdgeInsets.all(32),
                    children: [
                      // Görünüm
                      _SectionHeader(title: 'Görünüm', icon: Icons.palette_outlined),
                      const SizedBox(height: 8),
                      Card(
                        child: SwitchListTile(
                          title: const Text('Karanlık Mod'),
                          subtitle: const Text('Arayüz temasını değiştir'),
                          secondary: Icon(state.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded),
                          value: state.isDarkMode,
                          onChanged: (_) => cubit.toggleTheme(),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Oynatıcı
                      _SectionHeader(title: 'Oynatıcı', icon: Icons.play_circle_outline),
                      const SizedBox(height: 8),
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.high_quality_outlined),
                              title: const Text('Yayın Kalitesi'),
                              subtitle: Text(_qualityLabel(state.streamQuality)),
                              trailing: DropdownButton<String>(
                                value: state.streamQuality,
                                underline: const SizedBox.shrink(),
                                items: const [
                                  DropdownMenuItem(value: 'auto', child: Text('Otomatik')),
                                  DropdownMenuItem(value: 'high', child: Text('Yüksek')),
                                  DropdownMenuItem(value: 'medium', child: Text('Orta')),
                                  DropdownMenuItem(value: 'low', child: Text('Düşük')),
                                ],
                                onChanged: (v) {
                                  if (v != null) { cubit.setStreamQuality(v); }
                                },
                              ),
                            ),
                            const Divider(height: 1),
                            ListTile(
                              leading: const Icon(Icons.speed_outlined),
                              title: const Text('Tampon Süresi'),
                              subtitle: Text('${state.bufferDuration ~/ 1000} saniye'),
                              trailing: SizedBox(
                                width: 160,
                                child: Slider(
                                  value: state.bufferDuration.toDouble(),
                                  min: 2000,
                                  max: 30000,
                                  divisions: 14,
                                  label: '${state.bufferDuration ~/ 1000}s',
                                  onChanged: (v) => cubit.setBufferDuration(v.toInt()),
                                ),
                              ),
                            ),
                            const Divider(height: 1),
                            SwitchListTile(
                              title: const Text('Otomatik Oynat'),
                              subtitle: const Text('İçerik seçildiğinde otomatik başlat'),
                              secondary: const Icon(Icons.play_arrow_outlined),
                              value: state.autoPlay,
                              onChanged: (_) => cubit.toggleAutoPlay(),
                            ),
                            const Divider(height: 1),
                            SwitchListTile(
                              title: const Text('EPG Bilgisi Göster'),
                              subtitle: const Text('Canlı TV\'de program rehberi'),
                              secondary: const Icon(Icons.event_note_outlined),
                              value: state.showEpgInfo,
                              onChanged: (_) => cubit.toggleShowEpgInfo(),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Hesap
                      _SectionHeader(title: 'Hesap', icon: Icons.person_outline),
                      const SizedBox(height: 8),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, authState) {
                          if (authState is! AuthAuthenticated) return const SizedBox.shrink();
                          final user = authState.user;
                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.person),
                                  title: const Text('Kullanıcı'),
                                  subtitle: Text(user.username),
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  leading: const Icon(Icons.dns_outlined),
                                  title: const Text('Durum'),
                                  subtitle: Text(user.status),
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  leading: const Icon(Icons.devices),
                                  title: const Text('Bağlantılar'),
                                  subtitle: Text('${user.activeCons ?? '0'} / ${user.maxConnections ?? '1'}'),
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  leading: Icon(Icons.logout, color: cs.error),
                                  title: Text('Çıkış Yap', style: TextStyle(color: cs.error)),
                                  onTap: () => context.read<AuthBloc>().add(const AuthEvent.logout()),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      // Hakkında
                      _SectionHeader(title: 'Hakkında', icon: Icons.info_outline),
                      const SizedBox(height: 8),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.tv),
                          title: const Text('IPTV Player macOS'),
                          subtitle: const Text('v1.0.0'),
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

  String _qualityLabel(String quality) {
    switch (quality) {
      case 'high': return 'Yüksek kalite';
      case 'medium': return 'Orta kalite';
      case 'low': return 'Düşük kalite';
      default: return 'Otomatik';
    }
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, size: 18, color: cs.primary),
        const SizedBox(width: 8),
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: cs.primary, letterSpacing: -0.2)),
      ],
    );
  }
}
