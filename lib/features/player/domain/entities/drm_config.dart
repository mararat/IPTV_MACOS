abstract class DrmConfig {
  String get licenseUrl;
  Map<String, String> get headers;
  String get drmType;
}

class NoDrmConfig implements DrmConfig {
  const NoDrmConfig();

  @override
  String get licenseUrl => '';
  @override
  Map<String, String> get headers => {};
  @override
  String get drmType => 'none';
}
