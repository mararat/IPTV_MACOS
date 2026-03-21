import 'package:dio/dio.dart';
import 'package:iptv_macos/core/error/exceptions.dart';
import 'package:iptv_macos/core/error/failures.dart';

class ErrorHandler {
  const ErrorHandler._();

  static Failure handleException(Object error) {
    if (error is ServerException) {
      return ServerFailure(
        message: error.message,
        code: error.code,
        statusCode: error.statusCode,
        traceId: error.traceId,
        details: error.details,
      );
    }
    if (error is NetworkException) {
      return NetworkFailure(message: error.message);
    }
    if (error is CacheException) {
      return CacheFailure(message: error.message);
    }
    if (error is AuthException) {
      return AuthFailure(message: error.message, code: error.code);
    }
    if (error is DioException) {
      return _handleDioException(error);
    }
    return const UnknownFailure(message: 'Beklenmeyen bir hata olustu. Lutfen tekrar deneyin.');
  }

  static Failure _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
          message: 'Connection timed out',
          code: 'TIMEOUT',
        );
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.cancel:
        return const ServerFailure(
          message: 'Request cancelled',
          code: 'CANCELLED',
        );
      default:
        return const UnknownFailure(
          message: 'Bilinmeyen bir ag hatasi olustu.',
        );
    }
  }

  static Failure _handleBadResponse(Response<dynamic>? response) {
    if (response == null) {
      return const UnknownFailure();
    }

    final data = response.data;
    String message = 'Server error';
    String? code;
    String? traceId;

    if (data is Map<String, dynamic>) {
      message = data['message'] as String? ?? message;
      code = data['code'] as String?;
      traceId = data['traceId'] as String?;
    }

    switch (response.statusCode) {
      case 401:
        return AuthFailure(
          message: message,
          code: code ?? 'UNAUTHORIZED',
          traceId: traceId,
        );
      case 403:
        return AuthFailure(
          message: message,
          code: code ?? 'FORBIDDEN',
          traceId: traceId,
        );
      case 404:
        return ServerFailure(
          message: message,
          code: code ?? 'NOT_FOUND',
          statusCode: 404,
          traceId: traceId,
        );
      case 422:
        return ValidationFailure(
          message: message,
          code: code ?? 'VALIDATION_ERROR',
          details: data,
        );
      case 429:
        return ServerFailure(
          message: 'Too many requests',
          code: 'RATE_LIMIT',
          statusCode: 429,
          traceId: traceId,
        );
      default:
        return ServerFailure(
          message: message,
          code: code,
          statusCode: response.statusCode,
          traceId: traceId,
        );
    }
  }
}
