import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase implements UseCaseNoParams<void> {
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<void> call() {
    return _repository.logout();
  }
}
