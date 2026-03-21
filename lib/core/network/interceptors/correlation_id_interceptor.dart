import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

class CorrelationIdInterceptor extends Interceptor {
  final Uuid _uuid = const Uuid();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Correlation-ID'] = _uuid.v4();
    handler.next(options);
  }
}
