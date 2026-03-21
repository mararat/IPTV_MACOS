import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/theme/app_colors.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_event.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_state.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onNavigate});
  final ValueChanged<int> onNavigate;

  String _formatExpDate(String? expDate) {
    if (expDate == null || expDate.isEmpty) return 'Belirsiz';
    final ts = int.tryParse(expDate);
    if (ts != null) {
      final date = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
      return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
    }
    return expDate;
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
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: cs.surface,
            border: Border(bottom: BorderSide(color: cs.outlineVariant.withAlpha(40))),
          ),
          child: Row(
            children: [
              Image.asset('assets/images/iptv-logo-transparent.png', width: 28, height: 28),
              const SizedBox(width: 10),
              Text('IPTV Player', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: cs.primary, letterSpacing: -0.3)),
              const Spacer(),
              IconButton(icon: const Icon(Icons.refresh_rounded, size: 20), tooltip: 'Yenile', onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.preloadCounts());
              }),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, s) => IconButton(
                  icon: Icon(s.isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded, size: 20),
                  tooltip: s.isDarkMode ? 'Gündüz Modu' : 'Gece Modu',
                  onPressed: () => context.read<SettingsCubit>().toggleTheme(),
                ),
              ),
              IconButton(icon: const Icon(Icons.settings_outlined, size: 20), tooltip: 'Ayarlar', onPressed: () => onNavigate(4)),
              const SizedBox(width: 8),
              TextButton.icon(
                icon: const Icon(Icons.logout, size: 18),
                label: const Text('Çıkış'),
                onPressed: () => context.read<AuthBloc>().add(const AuthEvent.logout()),
              ),
            ],
          ),
        ),

        // Cards — centered, compact
        Expanded(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820, maxHeight: 240),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, authState) {
                  final liveCount = authState is AuthAuthenticated ? authState.liveCount : 0;
                  final vodCount = authState is AuthAuthenticated ? authState.vodCount : 0;
                  final seriesCount = authState is AuthAuthenticated ? authState.seriesCount : 0;

                  return Row(
                    children: [
                      Expanded(child: _DashCard(
                        icon: Icons.live_tv_rounded, title: 'Canlı TV', subtitle: 'Canlı yayın kanalları',
                        count: liveCount, gradient: const [Color(0xFFE74C3C), Color(0xFFC0392B)],
                        onTap: () => onNavigate(1),
                      )),
                      const SizedBox(width: 18),
                      Expanded(child: _DashCard(
                        icon: Icons.movie_rounded, title: 'Filmler', subtitle: 'Film arşivi',
                        count: vodCount, gradient: const [Color(0xFF2980B9), Color(0xFF1A5276)],
                        onTap: () => onNavigate(2),
                      )),
                      const SizedBox(width: 18),
                      Expanded(child: _DashCard(
                        icon: Icons.tv_rounded, title: 'Diziler', subtitle: 'Dizi arşivi',
                        count: seriesCount, gradient: const [Color(0xFF1ABC9C), Color(0xFF117A65)],
                        onTap: () => onNavigate(3),
                      )),
                    ],
                  );
                },
              ),
            ),
          ),
        ),

        // Bottom user info bar
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            if (authState is! AuthAuthenticated) return const SizedBox.shrink();
            final user = authState.user;
            final expFormatted = _formatExpDate(user.expDate);
            final daysLeft = _daysRemaining(user.expDate);
            final activeCons = int.tryParse(user.activeCons ?? '0') ?? 0;
            final maxCons = int.tryParse(user.maxConnections ?? '1') ?? 1;

            return Container(
              margin: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest.withAlpha(80),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: cs.outlineVariant.withAlpha(40)),
              ),
              child: Row(
                children: [
                  Container(width: 8, height: 8, decoration: BoxDecoration(color: AppColors.success, shape: BoxShape.circle)),
                  const SizedBox(width: 8),
                  Text('Bağlı', style: TextStyle(fontSize: 12, color: AppColors.success, fontWeight: FontWeight.w600)),
                  _sep(cs), Icon(Icons.person, size: 14, color: cs.primary), const SizedBox(width: 4),
                  Text(user.username, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: cs.onSurface)),
                  _sep(cs), Icon(Icons.calendar_today, size: 13, color: cs.onSurfaceVariant), const SizedBox(width: 4),
                  Text(expFormatted, style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
                  if (daysLeft >= 0) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: daysLeft < 30 ? AppColors.warning.withAlpha(30) : AppColors.success.withAlpha(30), borderRadius: BorderRadius.circular(6)),
                      child: Text('$daysLeft gün', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: daysLeft < 30 ? AppColors.warning : AppColors.success)),
                    ),
                  ],
                  _sep(cs), Icon(Icons.devices, size: 13, color: cs.onSurfaceVariant), const SizedBox(width: 4),
                  Text('$activeCons / $maxCons', style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
                  const Spacer(),
                  if (user.isTrial == '1')
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(color: AppColors.warning.withAlpha(30), borderRadius: BorderRadius.circular(6)),
                      child: Text('Deneme', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.warning)),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(color: AppColors.success.withAlpha(30), borderRadius: BorderRadius.circular(6)),
                      child: Text('Aktif', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.success)),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _sep(ColorScheme cs) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Container(width: 1, height: 16, color: cs.outlineVariant.withAlpha(40)),
  );
}

class _DashCard extends StatefulWidget {
  const _DashCard({required this.icon, required this.title, required this.subtitle, required this.count, required this.gradient, required this.onTap});
  final IconData icon; final String title; final String subtitle; final int count; final List<Color> gradient; final VoidCallback onTap;
  @override
  State<_DashCard> createState() => _DashCardState();
}

class _DashCardState extends State<_DashCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: _hovered ? (Matrix4.identity()..scale(1.02)) : Matrix4.identity(),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: widget.gradient),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: widget.gradient.last.withAlpha(_hovered ? 60 : 30), blurRadius: _hovered ? 20 : 10, offset: Offset(0, _hovered ? 6 : 3)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Positioned(right: -20, bottom: -20, child: Icon(widget.icon, size: 120, color: Colors.white.withAlpha(10))),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 44, height: 44,
                        decoration: BoxDecoration(color: Colors.white.withAlpha(28), borderRadius: BorderRadius.circular(12)),
                        child: Icon(widget.icon, color: Colors.white, size: 24),
                      ),
                      const SizedBox(height: 14),
                      Text(widget.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.2)),
                      const SizedBox(height: 3),
                      Text(widget.subtitle, style: TextStyle(fontSize: 11, color: Colors.white.withAlpha(180))),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                        decoration: BoxDecoration(color: Colors.white.withAlpha(28), borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          widget.count > 0 ? '${widget.count}' : '...',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
