import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iptv_macos/features/auth/domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated({
    required UserEntity user,
    @Default(0) int liveCount,
    @Default(0) int vodCount,
    @Default(0) int seriesCount,
    @Default(false) bool preloadComplete,
    @Default(false) bool liveLoading,
    @Default(false) bool vodLoading,
    @Default(false) bool seriesLoading,
  }) = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error({required String message}) = AuthError;
}
