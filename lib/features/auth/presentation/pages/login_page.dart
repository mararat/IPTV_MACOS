import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/theme/app_colors.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_event.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _serverUrlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _serverUrlController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: AppColors.error),
            );
          }
        },
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            padding: const EdgeInsets.all(40),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/iptv-logo-transparent.png', width: 80, height: 80),
                  const SizedBox(height: 16),
                  const Text('IPTV Player', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  Text('macOS', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _serverUrlController,
                    decoration: const InputDecoration(labelText: 'Server URL', hintText: 'http://example.com:8080', prefixIcon: Icon(Icons.dns_rounded)),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Server URL gerekli';
                      if (!v.startsWith('http://') && !v.startsWith('https://')) return 'http:// veya https:// ile baslamali';
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Kullanici Adi', prefixIcon: Icon(Icons.person_rounded)),
                    validator: (v) => (v == null || v.isEmpty) ? 'Kullanici adi gerekli' : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Sifre',
                      prefixIcon: const Icon(Icons.lock_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    onFieldSubmitted: (_) => _onSubmit(),
                    validator: (v) => (v == null || v.isEmpty) ? 'Sifre gerekli' : null,
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;
                      final errorMsg = state is AuthError ? state.message : null;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (errorMsg != null)
                            Container(
                              margin: const EdgeInsets.only(bottom: 14),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.error.withAlpha(20),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.error.withAlpha(60)),
                              ),
                              child: Row(children: [
                                Icon(Icons.error_outline, color: AppColors.error, size: 18),
                                const SizedBox(width: 8),
                                Expanded(child: Text(errorMsg, style: TextStyle(fontSize: 12, color: AppColors.error))),
                              ]),
                            ),
                          FilledButton(
                            onPressed: isLoading ? null : _onSubmit,
                            style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48), backgroundColor: AppColors.primary),
                            child: isLoading
                                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                                : const Text('Baglan', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    debugPrint('LOGIN: _onSubmit called');
    debugPrint('LOGIN: server=${_serverUrlController.text.trim()}');
    debugPrint('LOGIN: user=${_usernameController.text.trim()}');
    debugPrint('LOGIN: pass length=${_passwordController.text.length}');
    final valid = _formKey.currentState?.validate() ?? false;
    debugPrint('LOGIN: form valid=$valid');
    if (valid) {
      context.read<AuthBloc>().add(AuthEvent.login(
        serverUrl: _serverUrlController.text.trim(),
        username: _usernameController.text.trim(),
        password: _passwordController.text,
      ));
    }
  }
}
