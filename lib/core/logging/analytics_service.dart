import 'package:iptv_macos/core/config/env_config.dart';
import 'package:iptv_macos/core/logging/app_logger.dart';

abstract class AnalyticsEvent {
  static const String appStart = 'app_start';
  static const String loginSuccess = 'login_success';
  static const String loginFailure = 'login_failure';
  static const String logout = 'logout';
  static const String channelOpen = 'channel_open';
  static const String vodOpen = 'vod_open';
  static const String playStart = 'play_start';
  static const String playStop = 'play_stop';
  static const String playError = 'play_error';
  static const String rebuffer = 'rebuffer';
  static const String zapTime = 'zap_time';
  static const String searchPerformed = 'search_performed';
  static const String categorySelected = 'category_selected';
  static const String favoriteToggled = 'favorite_toggled';
}

class AnalyticsService {
  AnalyticsService(this._logger);

  final AppLogger _logger;

  static const _sensitiveKeys = {
    'password', 'token', 'secret', 'credential', 'authorization',
    'server_url', 'serverUrl', 'url', 'ip', 'email',
  };

  Future<void> logEvent(String name, [Map<String, dynamic>? params]) async {
    if (!EnvConfig.instance.enableAnalytics) {
      _logger.debug('Analytics event (disabled): $name');
      return;
    }
    final sanitized = _sanitizeParams(params ?? {});
    _logger.logEvent(name, sanitized);
  }

  Map<String, dynamic> _sanitizeParams(Map<String, dynamic> params) {
    return Map.fromEntries(
      params.entries.where((e) =>
          !_sensitiveKeys.contains(e.key.toLowerCase())),
    );
  }

  Future<void> setUserId(String userId) async {
    _logger.info('Analytics: setUserId');
  }

  Future<void> clearUserId() async {
    _logger.info('Analytics: clearUserId');
  }

  Future<void> setUserProperty(String name, String value) async {
    _logger.debug('Analytics: setUserProperty $name');
  }
}
