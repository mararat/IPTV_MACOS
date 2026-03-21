import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = AuthCheckAuth;
  const factory AuthEvent.login({
    required String serverUrl,
    required String username,
    required String password,
  }) = AuthLogin;
  const factory AuthEvent.logout() = AuthLogout;
  const factory AuthEvent.refreshData() = AuthRefreshData;
  const factory AuthEvent.preloadCounts() = AuthPreloadCounts;
}
