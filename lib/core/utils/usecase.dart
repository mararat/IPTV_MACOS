import 'package:iptv_macos/core/utils/typedefs.dart';

abstract class UseCase<T, Params> {
  ResultFuture<T> call(Params params);
}

abstract class UseCaseNoParams<T> {
  ResultFuture<T> call();
}

class NoParams {
  const NoParams();
}
