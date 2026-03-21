import 'package:talker/talker.dart';
import 'package:iptv_macos/core/config/env_config.dart';

class AppLogger {
  AppLogger(this._talker);

  final Talker _talker;

  static const Set<String> _piiKeys = {
    'password',
    'username',
    'email',
    'token',
    'accessToken',
    'refreshToken',
    'authorization',
    'serverUrl',
  };

  void debug(String message, [Object? data]) {
    if (!EnvConfig.instance.enableLogging) return;
    _talker.debug(_redact(message), data);
  }

  void info(String message, [Object? data]) {
    _talker.info(_redact(message), data);
  }

  void warning(String message, [Object? data]) {
    _talker.warning(_redact(message), data);
  }

  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _talker.error(_redact(message), error, stackTrace);
  }

  void logEvent(String event, Map<String, dynamic> params) {
    final redactedParams = _redactMap(params);
    _talker.log('EVENT: $event | $redactedParams');
  }

  /// Redact URL query params (username=xxx&password=xxx) and path credentials
  static final RegExp _urlCredentialPattern = RegExp(
    r'(username|password)=[^&\s]+',
    caseSensitive: false,
  );

  String _redact(String message) {
    var redacted = message;
    // Redact URL credentials first
    redacted = redacted.replaceAllMapped(
        _urlCredentialPattern, (m) => '${m.group(1)}=***REDACTED***');
    // Redact key=value pairs
    for (final key in _piiKeys) {
      final pattern = RegExp(
        '$key["\']?\\s*[:=]\\s*["\']?[^"\'\\s,}]+',
        caseSensitive: false,
      );
      redacted = redacted.replaceAll(pattern, '$key=***REDACTED***');
    }
    return redacted;
  }

  Map<String, dynamic> _redactMap(Map<String, dynamic> data) {
    return data.map((key, value) {
      if (_piiKeys.contains(key.toLowerCase())) {
        return MapEntry(key, '***REDACTED***');
      }
      if (value is Map<String, dynamic>) {
        return MapEntry(key, _redactMap(value));
      }
      return MapEntry(key, value);
    });
  }
}
