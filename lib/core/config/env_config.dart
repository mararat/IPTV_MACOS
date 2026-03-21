enum Flavor { dev, stage, prod }

class EnvConfig {
  const EnvConfig._({
    required this.flavor,
    required this.enableLogging,
  });

  final Flavor flavor;
  final bool enableLogging;

  bool get isDev => flavor == Flavor.dev;
  bool get isProd => flavor == Flavor.prod;

  static EnvConfig? _instance;
  static EnvConfig get instance => _instance!;

  static void initialize({required String flavor}) {
    final flavorEnum = Flavor.values.firstWhere(
      (f) => f.name == flavor,
      orElse: () => Flavor.dev,
    );
    _instance = EnvConfig._(
      flavor: flavorEnum,
      enableLogging: flavorEnum != Flavor.prod,
    );
  }
}
