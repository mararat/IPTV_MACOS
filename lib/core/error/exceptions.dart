class ServerException implements Exception {
  const ServerException({
    required this.message,
    this.statusCode,
    this.code,
    this.traceId,
    this.details,
  });

  final String message;
  final int? statusCode;
  final String? code;
  final String? traceId;
  final dynamic details;

  @override
  String toString() => 'ServerException($statusCode): $message [$code]';
}

class CacheException implements Exception {
  const CacheException({this.message = 'Cache operation failed'});
  final String message;

  @override
  String toString() => 'CacheException: $message';
}

class NetworkException implements Exception {
  const NetworkException({this.message = 'No internet connection'});
  final String message;

  @override
  String toString() => 'NetworkException: $message';
}

class AuthException implements Exception {
  const AuthException({required this.message, this.code});
  final String message;
  final String? code;

  @override
  String toString() => 'AuthException: $message [$code]';
}
