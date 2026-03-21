import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/auth/domain/entities/auth_tokens.dart';
import 'package:iptv_macos/features/auth/domain/entities/user_entity.dart';
import 'package:iptv_macos/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<({UserEntity user, XtreamCredentials credentials}), LoginParams> {
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<({UserEntity user, XtreamCredentials credentials})> call(LoginParams params) {
    return _repository.login(
      serverUrl: params.serverUrl,
      username: params.username,
      password: params.password,
    );
  }
}

class LoginParams {
  const LoginParams({
    required this.serverUrl,
    required this.username,
    required this.password,
  });

  final String serverUrl;
  final String username;
  final String password;
}
