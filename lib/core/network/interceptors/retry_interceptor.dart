import 'dart:async';
import 'dart:math';
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  RetryInterceptor(this._dio);

  final Dio _dio;
  static const int _maxRetries = 3;
  static const Duration _baseDelay = Duration(seconds: 1);
  static const Duration _maxDelay = Duration(seconds: 15);
  static const Set<String> _retryableMethods = {'GET', 'HEAD', 'OPTIONS'};

  // Circuit breaker state
  int _consecutiveFailures = 0;
  DateTime? _circuitOpenUntil;
  static const int _circuitBreakerThreshold = 5;
  static const Duration _circuitOpenDuration = Duration(seconds: 30);

  final _random = Random();

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Circuit breaker: if open, reject immediately
    if (_isCircuitOpen()) {
      return handler.next(err);
    }

    final method = err.requestOptions.method.toUpperCase();
    if (!_retryableMethods.contains(method)) {
      return handler.next(err);
    }

    if (!_isRetryable(err)) {
      _recordFailure();
      return handler.next(err);
    }

    final retryCount = err.requestOptions.extra['retryCount'] as int? ?? 0;
    if (retryCount >= _maxRetries) {
      _recordFailure();
      return handler.next(err);
    }

    // Exponential backoff with jitter, capped at _maxDelay
    final baseMs = _baseDelay.inMilliseconds * pow(2, retryCount).toInt();
    final jitterMs = _random.nextInt(baseMs ~/ 2 + 1);
    final delayMs = min(baseMs + jitterMs, _maxDelay.inMilliseconds);
    await Future<void>.delayed(Duration(milliseconds: delayMs));

    err.requestOptions.extra['retryCount'] = retryCount + 1;

    try {
      final response = await _dio.fetch<dynamic>(err.requestOptions);
      _resetCircuitBreaker();
      handler.resolve(response);
    } on DioException catch (e) {
      _recordFailure();
      handler.next(e);
    }
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    _resetCircuitBreaker();
    handler.next(response);
  }

  bool _isCircuitOpen() {
    if (_circuitOpenUntil == null) return false;
    if (DateTime.now().isAfter(_circuitOpenUntil!)) {
      // Half-open: allow one request through
      _circuitOpenUntil = null;
      _consecutiveFailures = _circuitBreakerThreshold - 1;
      return false;
    }
    return true;
  }

  void _recordFailure() {
    _consecutiveFailures++;
    if (_consecutiveFailures >= _circuitBreakerThreshold) {
      _circuitOpenUntil = DateTime.now().add(_circuitOpenDuration);
    }
  }

  void _resetCircuitBreaker() {
    _consecutiveFailures = 0;
    _circuitOpenUntil = null;
  }

  bool _isRetryable(DioException err) {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError) {
      return true;
    }
    final statusCode = err.response?.statusCode;
    if (statusCode != null &&
        (statusCode == 502 || statusCode == 503 || statusCode == 504)) {
      return true;
    }
    return false;
  }
}
