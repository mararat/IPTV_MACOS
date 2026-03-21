import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/di/service_locator.dart';
import 'package:iptv_macos/core/theme/app_theme.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_event.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_state.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:iptv_macos/features/settings/presentation/bloc/settings_state.dart';
import 'package:iptv_macos/features/auth/presentation/pages/login_page.dart';
import 'package:iptv_macos/app/shell_page.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthBloc _authBloc;
  final _settingsCubit = SettingsCubit();

  @override
  void initState() {
    super.initState();
    _authBloc = sl.createAuthBloc();
    _authBloc.add(const AuthEvent.checkAuth());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authBloc),
        BlocProvider.value(value: _settingsCubit),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settings) {
          return MaterialApp(
            title: 'IPTV Player',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthAuthenticated) return const ShellPage();
                if (state is AuthLoading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
                return const LoginPage();
              },
            ),
          );
        },
      ),
    );
  }
}
