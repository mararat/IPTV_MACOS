enum Flavor { dev, stage, prod }

class EnvConfig {
  const EnvConfig._({
    required this.flavor,
    required this.baseUrl,
    required this.enableLogging,
    required this.logLevel,
    required this.enableCrashlytics,
    required this.enableAnalytics,
    required this.cacheTtlMinutes,
  });

  final Flavor flavor;
  final String baseUrl;
  final bool enableLogging;
  final String logLevel;
  final bool enableCrashlytics;
  final bool enableAnalytics;
  final int cacheTtlMinutes;

  bool get isDev => flavor == Flavor.dev;
  bool get isStage => flavor == Flavor.stage;
  bool get isProd => flavor == Flavor.prod;

  static EnvConfig? _instance;
  static EnvConfig get instance => _instance!;

  static void initialize({
    required String flavor,
    String baseUrl = '',
    String logLevel = 'debug',
    bool enableCrashlytics = false,
    bool enableAnalytics = false,
    int cacheTtlMinutes = 30,
  }) {
    final flavorEnum = Flavor.values.firstWhere(
      (f) => f.name == flavor,
      orElse: () => Flavor.dev,
    );

    _instance = EnvConfig._(
      flavor: flavorEnum,
      baseUrl: baseUrl,
      enableLogging: flavorEnum != Flavor.prod,
      logLevel: logLevel,
      enableCrashlytics: enableCrashlytics,
      enableAnalytics: enableAnalytics,
      cacheTtlMinutes: cacheTtlMinutes,
    );
  }

  static const dev = EnvConfig._(
    flavor: Flavor.dev,
    baseUrl: '',
    enableLogging: true,
    logLevel: 'debug',
    enableCrashlytics: false,
    enableAnalytics: false,
    cacheTtlMinutes: 5,
  );

  static const stage = EnvConfig._(
    flavor: Flavor.stage,
    baseUrl: '',
    enableLogging: true,
    logLevel: 'info',
    enableCrashlytics: true,
    enableAnalytics: false,
    cacheTtlMinutes: 15,
  );

  static const prod = EnvConfig._(
    flavor: Flavor.prod,
    baseUrl: '',
    enableLogging: false,
    logLevel: 'error',
    enableCrashlytics: true,
    enableAnalytics: true,
    cacheTtlMinutes: 30,
  );
}
