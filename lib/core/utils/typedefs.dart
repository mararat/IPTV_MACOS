import 'package:iptv_macos/core/error/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
sealed class Either<L, R> {
  const Either();

  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight);
  bool get isLeft;
  bool get isRight;
  R? get rightOrNull;
  L? get leftOrNull;

  Either<L, T> map<T>(T Function(R r) f);
  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f);
}

class Left<L, R> extends Either<L, R> {
  const Left(this.value);
  final L value;

  @override
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight) => onLeft(value);

  @override
  bool get isLeft => true;

  @override
  bool get isRight => false;

  @override
  R? get rightOrNull => null;

  @override
  L? get leftOrNull => value;

  @override
  Either<L, T> map<T>(T Function(R r) f) => Left(value);

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) => Left(value);

  @override
  bool operator ==(Object other) =>
      other is Left<L, R> && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

class Right<L, R> extends Either<L, R> {
  const Right(this.value);
  final R value;

  @override
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight) =>
      onRight(value);

  @override
  bool get isLeft => false;

  @override
  bool get isRight => true;

  @override
  R? get rightOrNull => value;

  @override
  L? get leftOrNull => null;

  @override
  Either<L, T> map<T>(T Function(R r) f) => Right(f(value));

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) => f(value);

  @override
  bool operator ==(Object other) =>
      other is Right<L, R> && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
