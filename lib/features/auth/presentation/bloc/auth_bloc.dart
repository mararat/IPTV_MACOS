import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iptv_macos/core/logging/analytics_service.dart';
import 'package:iptv_macos/core/logging/app_logger.dart';
import 'package:iptv_macos/core/network/xtream_api_service.dart';
import 'package:iptv_macos/features/auth/domain/entities/user_entity.dart';
import 'package:iptv_macos/features/auth/domain/repositories/auth_repository.dart';
import 'package:iptv_macos/features/auth/domain/usecases/check_auth_usecase.dart';
import 'package:iptv_macos/features/auth/domain/usecases/login_usecase.dart';
import 'package:iptv_macos/features/auth/domain/usecases/logout_usecase.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_event.dart';
import 'package:iptv_macos/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._loginUseCase,
    this._logoutUseCase,
    this._checkAuthUseCase,
    this._authRepository,
    this._xtreamApi,
    this._analyticsService,
    dynamic _, // unused on macOS (was CacheMetadataDao)
    this._logger,
  ) : super(const AuthState.initial()) {
    on<AuthCheckAuth>(_onCheckAuth);
    on<AuthLogin>(_onLogin);
    on<AuthLogout>(_onLogout);
    on<AuthRefreshData>(_onRefreshData);
    on<AuthPreloadCounts>(_onPreloadCounts);
  }

  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthUseCase _checkAuthUseCase;
  final AuthRepository _authRepository;
  final XtreamApiService _xtreamApi;
  final AnalyticsService _analyticsService;
  final AppLogger _logger;

  Future<void> _onCheckAuth(AuthCheckAuth event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _checkAuthUseCase();
    final isAuth = result.fold((_) => false, (value) => value);
    if (!isAuth) { emit(const AuthState.unauthenticated()); return; }

    final userResult = await _authRepository.getCachedUser();
    final cachedUser = userResult.fold((_) => null, (user) => user);
    emit(AuthState.authenticated(user: cachedUser ?? const UserEntity(username: '', status: 'Active')));
  }

  Future<void> _onLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _loginUseCase(LoginParams(serverUrl: event.serverUrl, username: event.username, password: event.password));
    result.fold(
      (failure) {
        _analyticsService.logEvent(AnalyticsEvent.loginFailure, {'error': failure.code ?? 'unknown'});
        emit(AuthState.error(message: failure.message));
      },
      (data) {
        _analyticsService.logEvent(AnalyticsEvent.loginSuccess);
        _analyticsService.setUserId(data.user.username);
        emit(AuthState.authenticated(user: data.user));
      },
    );
  }

  Future<void> _onLogout(AuthLogout event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    await _logoutUseCase();
    await _analyticsService.clearUserId();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onRefreshData(AuthRefreshData event, Emitter<AuthState> emit) async {
    final result = await _authRepository.refreshUser();
    result.fold(
      (failure) => _logger.debug('Refresh user failed: ${failure.message}'),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> _onPreloadCounts(AuthPreloadCounts event, Emitter<AuthState> emit) async {
    final s = state;
    if (s is! AuthAuthenticated) return;
    emit(s.copyWith(preloadComplete: false));

    try {
      final liveStreams = await _xtreamApi.getLiveStreams();
      if (emit.isDone) return;
      emit(s.copyWith(liveCount: liveStreams.length, preloadComplete: false));

      final vodStreams = await _xtreamApi.getVodStreams();
      if (emit.isDone) return;
      emit(s.copyWith(liveCount: liveStreams.length, vodCount: vodStreams.length, preloadComplete: false));

      final seriesList = await _xtreamApi.getSeries();
      if (emit.isDone) return;
      emit(s.copyWith(liveCount: liveStreams.length, vodCount: vodStreams.length, seriesCount: seriesList.length, preloadComplete: true));
    } catch (e, st) {
      _logger.debug('Preload counts failed: $e', st);
      if (!emit.isDone) {
        final current = state;
        if (current is AuthAuthenticated) emit(current.copyWith(preloadComplete: true));
      }
    }
  }
}
