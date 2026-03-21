import 'package:iptv_macos/core/logging/app_logger.dart';

abstract class AnalyticsEvent {
  static const String loginSuccess = 'login_success';
  static const String loginFailure = 'login_failure';
  static const String playStart = 'play_start';
  static const String playStop = 'play_stop';
  static const String playError = 'play_error';
  static const String zapTime = 'zap_time';
}

class AnalyticsService {
  AnalyticsService(this._logger);

  final AppLogger _logger;

  void logEvent(String name, [Map<String, dynamic>? params]) {
    _logger.debug('Analytics: $name');
  }

  void setUserId(String userId) {
    _logger.debug('Analytics: setUserId');
  }

  Future<void> clearUserId() async {
    _logger.debug('Analytics: clearUserId');
  }
}
