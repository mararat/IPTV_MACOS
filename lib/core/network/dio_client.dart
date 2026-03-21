import 'package:dio/dio.dart';
import 'package:iptv_macos/core/network/interceptors/correlation_id_interceptor.dart';
import 'package:iptv_macos/core/network/interceptors/retry_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker/talker.dart';
import 'package:iptv_macos/core/config/env_config.dart';

class DioClient {
  DioClient(this._dio, this._talker) {
    _setupInterceptors();
  }

  final Dio _dio;
  final Talker _talker;

  void _setupInterceptors() {
    _dio.interceptors.clear();
    _dio.interceptors.addAll([
      CorrelationIdInterceptor(),
      RetryInterceptor(_dio),
      if (EnvConfig.instance.enableLogging)
        TalkerDioLogger(
          talker: _talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: false,
            printResponseHeaders: false,
            printResponseMessage: false,
            printRequestData: false,
            printResponseData: false,
          ),
        ),
    ]);
  }
}
