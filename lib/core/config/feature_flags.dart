class FeatureFlags {
  FeatureFlags._();

  static final FeatureFlags _instance = FeatureFlags._();
  static FeatureFlags get instance => _instance;

  final Map<String, bool> _localOverrides = {};
  Map<String, dynamic> _remoteFlags = {};

  static const String enableDrm = 'enable_drm';
  static const String enablePip = 'enable_pip';
  static const String enableCertPinning = 'enable_cert_pinning';
  static const String enableJailbreakDetection = 'enable_jailbreak_detection';
  static const String enableOfflineMode = 'enable_offline_mode';
  static const String enableContinueWatching = 'enable_continue_watching';

  static const Map<String, bool> _defaults = {
    enableDrm: false,
    enablePip: false,
    enableCertPinning: false,
    enableJailbreakDetection: false,
    enableOfflineMode: false,
    enableContinueWatching: true,
  };

  void updateRemoteFlags(Map<String, dynamic> flags) {
    _remoteFlags = flags;
  }

  void setLocalOverride(String key, bool value) {
    _localOverrides[key] = value;
  }

  void clearLocalOverride(String key) {
    _localOverrides.remove(key);
  }

  bool isEnabled(String key) {
    if (_localOverrides.containsKey(key)) {
      return _localOverrides[key]!;
    }
    if (_remoteFlags.containsKey(key)) {
      final value = _remoteFlags[key];
      if (value is bool) return value;
      if (value is String) return value.toLowerCase() == 'true';
    }
    return _defaults[key] ?? false;
  }
}
