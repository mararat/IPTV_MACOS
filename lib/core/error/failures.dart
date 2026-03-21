import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    this.code,
    this.traceId,
    this.details,
  });

  final String message;
  final String? code;
  final String? traceId;
  final dynamic details;

  @override
  List<Object?> get props => [message, code, traceId];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.code,
    super.traceId,
    super.details,
    this.statusCode,
  });

  final int? statusCode;

  @override
  List<Object?> get props => [...super.props, statusCode];
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection',
    super.code = 'NETWORK_ERROR',
  });
}

class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Cache error',
    super.code = 'CACHE_ERROR',
  });
}

class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.code = 'AUTH_ERROR',
    super.traceId,
  });
}

class SessionExpiredFailure extends Failure {
  const SessionExpiredFailure({
    super.message = 'Session expired. Please login again.',
    super.code = 'SESSION_EXPIRED',
  });
}

class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code = 'VALIDATION_ERROR',
    super.details,
  });
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'An unexpected error occurred',
    super.code = 'UNKNOWN_ERROR',
    super.traceId,
  });
}
