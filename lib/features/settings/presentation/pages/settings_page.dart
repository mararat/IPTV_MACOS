import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/di/service_locator.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_event.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_state.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_state.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, this.onBack});
  final VoidCallback? onBack;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _liveHistoryCount = 0;
  int _vodHistoryCount = 0;
  int _seriesHistoryCount = 0;
  bool _historyLoading = true;

  @override
  void initState() {
    super.initState();
    _loadHistoryCounts();
  }

  Future<void> _loadHistoryCounts() async {
    final wh = sl.watchHistoryService;
    final live = await wh.getCount('live');
    final vod = await wh.getCount('vod');
    final series = await wh.getCount('series');
    if (mounted) {
      setState(() {
        _liveHistoryCount = live;
        _vodHistoryCount = vod;
        _seriesHistoryCount = series;
        _historyLoading = false;
      });
    }
  }

  Future<void> _clearHistory(String type, String label) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Geçmişi Temizle'),
        content: Text('$label izleme geçmişi silinecek. Devam edilsin mi?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('İptal')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Temizle')),
        ],
      ),
    );
    if (confirmed == true) {
      await sl.watchHistoryService.clearHistory(type);
      _loadHistoryCounts();
    }
  }

  Future<void> _clearAllHistory() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Tüm Geçmişi Temizle'),
        content: const Text('Tüm izleme geçmişi silinecek. Bu işlem geri alınamaz.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('İptal')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Temizle', style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await sl.watchHistoryService.clearAll();
      _loadHistoryCounts();
    }
  }

  String _formatExpDate(String? expDate) {
    if (expDate == null || expDate.isEmpty) return 'Belirsiz';
    final ts = int.tryParse(expDate);
    if (ts != null) {
      final date = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
      return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
    }
    return expDate;
  }

  String _formatCreatedAt(String? createdAt) {
    if (createdAt == null || createdAt.isEmpty) return 'Bilinmiyor';
    final ts = int.tryParse(createdAt);
    if (ts != null) {
      final date = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
      return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
    }
    return createdAt;
  }

  int _daysRemaining(String? expDate) {
    if (expDate == null || expDate.isEmpty) return -1;
    final ts = int.tryParse(expDate);
    if (ts != null) {
      final date = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
      return date.difference(DateTime.now()).inDays;
    }
    return -1;
  }

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
              if (widget.onBack != null)
                IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 20), onPressed: widget.onBack, tooltip: 'Ana Sayfa'),
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
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: ListView(
                    padding: const EdgeInsets.all(32),
                    children: [
                      // ── Görünüm ──
                      const _SectionHeader(title: 'Görünüm', icon: Icons.palette_outlined),
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

                      const SizedBox(height: 28),

                      // ── Oynatıcı ──
                      const _SectionHeader(title: 'Oynatıcı', icon: Icons.play_circle_outline),
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
                                width: 180,
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
                              subtitle: const Text('Içerik seçildiğinde otomatik başlat'),
                              secondary: const Icon(Icons.play_arrow_outlined),
                              value: state.autoPlay,
                              onChanged: (_) => cubit.toggleAutoPlay(),
                            ),
                            const Divider(height: 1),
                            SwitchListTile(
                              title: const Text('EPG Bilgisi'),
                              subtitle: const Text('Canlı TV\'de program rehberi göster'),
                              secondary: const Icon(Icons.event_note_outlined),
                              value: state.showEpgInfo,
                              onChanged: (_) => cubit.toggleShowEpgInfo(),
                            ),
                            const Divider(height: 1),
                            ListTile(
                              leading: const Icon(Icons.web_outlined),
                              title: const Text('User Agent'),
                              subtitle: Text(state.userAgent == 'default' ? 'Varsayılan' : state.userAgent, overflow: TextOverflow.ellipsis),
                              trailing: const Icon(Icons.edit_outlined, size: 18),
                              onTap: () => _showUserAgentDialog(context, state.userAgent, cubit),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // ── Izleme Geçmişi ──
                      const _SectionHeader(title: 'İzleme Geçmişi', icon: Icons.history),
                      const SizedBox(height: 8),
                      Card(
                        child: _historyLoading
                            ? const Padding(
                                padding: EdgeInsets.all(24),
                                child: Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))),
                              )
                            : Column(
                                children: [
                                  _HistoryTile(
                                    icon: Icons.live_tv_rounded,
                                    title: 'Canlı TV',
                                    count: _liveHistoryCount,
                                    onClear: _liveHistoryCount > 0 ? () => _clearHistory('live', 'Canlı TV') : null,
                                  ),
                                  const Divider(height: 1),
                                  _HistoryTile(
                                    icon: Icons.movie_rounded,
                                    title: 'Filmler',
                                    count: _vodHistoryCount,
                                    onClear: _vodHistoryCount > 0 ? () => _clearHistory('vod', 'Film') : null,
                                  ),
                                  const Divider(height: 1),
                                  _HistoryTile(
                                    icon: Icons.tv_rounded,
                                    title: 'Diziler',
                                    count: _seriesHistoryCount,
                                    onClear: _seriesHistoryCount > 0 ? () => _clearHistory('series', 'Dizi') : null,
                                  ),
                                  if (_liveHistoryCount + _vodHistoryCount + _seriesHistoryCount > 0) ...[
                                    const Divider(height: 1),
                                    ListTile(
                                      leading: Icon(Icons.delete_sweep_outlined, color: cs.error),
                                      title: Text('Tümünü Temizle', style: TextStyle(color: cs.error)),
                                      subtitle: Text('${_liveHistoryCount + _vodHistoryCount + _seriesHistoryCount} kayıt'),
                                      onTap: _clearAllHistory,
                                    ),
                                  ],
                                ],
                              ),
                      ),

                      const SizedBox(height: 28),

                      // ── Sunucu & Hesap ──
                      const _SectionHeader(title: 'Sunucu & Hesap', icon: Icons.dns_outlined),
                      const SizedBox(height: 8),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, authState) {
                          if (authState is! AuthAuthenticated) return const SizedBox.shrink();
                          final user = authState.user;
                          final daysLeft = _daysRemaining(user.expDate);
                          final activeCons = int.tryParse(user.activeCons ?? '0') ?? 0;
                          final maxCons = int.tryParse(user.maxConnections ?? '1') ?? 1;

                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.person),
                                  title: const Text('Kullanıcı'),
                                  subtitle: Text(user.username),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.copy, size: 16),
                                    tooltip: 'Kopyala',
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(text: user.username));
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Kullanıcı adı kopyalandı'), duration: Duration(seconds: 1)),
                                      );
                                    },
                                  ),
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  leading: const Icon(Icons.link),
                                  title: const Text('Sunucu'),
                                  subtitle: Text(sl.xtreamApi.serverUrl, overflow: TextOverflow.ellipsis),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.copy, size: 16),
                                    tooltip: 'Kopyala',
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(text: sl.xtreamApi.serverUrl));
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Sunucu adresi kopyalandı'), duration: Duration(seconds: 1)),
                                      );
                                    },
                                  ),
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  leading: Icon(
                                    user.status.toLowerCase() == 'active' ? Icons.check_circle : Icons.error,
                                    color: user.status.toLowerCase() == 'active' ? Colors.green : Colors.red,
                                  ),
                                  title: const Text('Durum'),
                                  subtitle: Text(user.status.toLowerCase() == 'active' ? 'Aktif' : user.status),
                                  trailing: user.isTrial == '1'
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(color: Colors.orange.withAlpha(30), borderRadius: BorderRadius.circular(6)),
                                          child: const Text('Deneme', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.orange)),
                                        )
                                      : null,
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  leading: const Icon(Icons.calendar_today),
                                  title: const Text('Bitiş Tarihi'),
                                  subtitle: Text(_formatExpDate(user.expDate)),
                                  trailing: daysLeft >= 0
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: daysLeft < 30 ? Colors.orange.withAlpha(30) : Colors.green.withAlpha(30),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            '$daysLeft gün kaldı',
                                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: daysLeft < 30 ? Colors.orange : Colors.green),
                                          ),
                                        )
                                      : null,
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  leading: const Icon(Icons.event),
                                  title: const Text('Kayıt Tarihi'),
                                  subtitle: Text(_formatCreatedAt(user.createdAt)),
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  leading: const Icon(Icons.devices),
                                  title: const Text('Eşzamanlı Bağlantı'),
                                  subtitle: Text('$activeCons / $maxCons kullanımda'),
                                  trailing: LinearProgressIndicator(
                                    value: maxCons > 0 ? activeCons / maxCons : 0,
                                    backgroundColor: cs.surfaceContainerHighest,
                                  ).constrainWidth(80),
                                ),
                                if (user.allowedOutputFormats.isNotEmpty) ...[
                                  const Divider(height: 1),
                                  ListTile(
                                    leading: const Icon(Icons.video_settings),
                                    title: const Text('Desteklenen Formatlar'),
                                    subtitle: Text(user.allowedOutputFormats.join(', ')),
                                  ),
                                ],
                                const Divider(height: 1),
                                ListTile(
                                  leading: const Icon(Icons.content_copy_outlined),
                                  title: const Text('İçerik Sayıları'),
                                  subtitle: BlocBuilder<AuthBloc, AuthState>(
                                    builder: (ctx, s) {
                                      if (s is! AuthAuthenticated) return const Text('...');
                                      return Text('Canlı: ${s.liveCount}  |  Film: ${s.vodCount}  |  Dizi: ${s.seriesCount}');
                                    },
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.refresh, size: 18),
                                    tooltip: 'Yenile',
                                    onPressed: () => context.read<AuthBloc>().add(const AuthEvent.preloadCounts()),
                                  ),
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  leading: Icon(Icons.logout, color: cs.error),
                                  title: Text('Çıkış Yap', style: TextStyle(color: cs.error, fontWeight: FontWeight.w600)),
                                  subtitle: const Text('Oturumu kapat ve giriş ekranına dön'),
                                  onTap: () => context.read<AuthBloc>().add(const AuthEvent.logout()),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 28),

                      // ── Hakkında ──
                      const _SectionHeader(title: 'Hakkında', icon: Icons.info_outline),
                      const SizedBox(height: 8),
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.tv),
                              title: const Text('IPTV Player macOS'),
                              subtitle: const Text('v1.0.0'),
                            ),
                            const Divider(height: 1),
                            const ListTile(
                              leading: Icon(Icons.code),
                              title: Text('Framework'),
                              subtitle: Text('Flutter + Dart'),
                            ),
                            const Divider(height: 1),
                            const ListTile(
                              leading: Icon(Icons.video_library_outlined),
                              title: Text('Video Motoru'),
                              subtitle: Text('media_kit (mpv tabanlı)'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
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

  void _showUserAgentDialog(BuildContext context, String currentAgent, SettingsCubit cubit) {
    final controller = TextEditingController(text: currentAgent == 'default' ? '' : currentAgent);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('User Agent'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Özel bir User Agent belirleyin. Boş bırakırsanız varsayılan kullanılır.',
                style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.onSurfaceVariant)),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Örn: VLC/3.0.20 LibVLC/3.0.20',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('İptal')),
          TextButton(
            onPressed: () {
              cubit.setUserAgent(controller.text.trim().isEmpty ? 'default' : controller.text.trim());
              Navigator.pop(ctx);
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
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

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.icon, required this.title, required this.count, this.onClear});
  final IconData icon;
  final String title;
  final int count;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text('$count kayıt'),
      trailing: onClear != null
          ? IconButton(icon: const Icon(Icons.delete_outline, size: 18), tooltip: 'Temizle', onPressed: onClear)
          : null,
    );
  }
}

extension _WidgetConstraints on Widget {
  Widget constrainWidth(double width) => SizedBox(width: width, child: this);
}
