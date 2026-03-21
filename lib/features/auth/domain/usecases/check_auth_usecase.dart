import 'package:iptv_macos/core/utils/typedefs.dart';
import 'package:iptv_macos/core/utils/usecase.dart';
import 'package:iptv_macos/features/auth/domain/repositories/auth_repository.dart';

class CheckAuthUseCase implements UseCaseNoParams<bool> {
  const CheckAuthUseCase(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<bool> call() {
    return _repository.isAuthenticated();
  }
}
