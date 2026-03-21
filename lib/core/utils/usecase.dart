import 'package:iptv_macos/core/utils/typedefs.dart';

abstract class UseCase<T, Params> {
  ResultFuture<T> call(Params params);
}

abstract class UseCaseNoParams<T> {
  ResultFuture<T> call();
}

abstract class StreamUseCase<T, Params> {
  ResultStream<T> call(Params params);
}

class NoParams {
  const NoParams();
}
