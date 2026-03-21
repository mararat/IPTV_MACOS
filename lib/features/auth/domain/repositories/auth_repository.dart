import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/features/auth/domain/entities/auth_tokens.dart';
import 'package:iptv_macos/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  ResultFuture<({UserEntity user, XtreamCredentials credentials})> login({
    required String serverUrl,
    required String username,
    required String password,
  });

  ResultFuture<void> logout();

  ResultFuture<bool> isAuthenticated();

  ResultFuture<UserEntity?> getCachedUser();

  ResultFuture<XtreamCredentials?> getSavedCredentials();

  ResultFuture<UserEntity> refreshUser();
}
