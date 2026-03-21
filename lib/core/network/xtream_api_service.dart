import 'package:dio/dio.dart';
import 'package:iptv_macos/core/error/exceptions.dart';

class XtreamApiService {
  XtreamApiService(this._dio);

  final Dio _dio;

  String _serverUrl = '';
  String _username = '';
  String _password = '';

  /// Track visited URLs to prevent redirect loops
  final Set<String> _visitedUrls = {};

  /// Rate limit: track last refresh time per cache key
  final Map<String, DateTime> _lastRefreshTimes = {};

  /// Prevent concurrent resolve calls
  bool _isResolving = false;

  void setCredentials({
    required String serverUrl,
    required String username,
    required String password,
  }) {
    // Input length validation
    if (serverUrl.length > 2048) {
      throw const ServerException(message: 'Server URL cok uzun (max 2048 karakter)');
    }
    if (username.length > 50) {
      throw const ServerException(message: 'Kullanici adi cok uzun (max 50 karakter)');
    }
    if (password.length > 256) {
      throw const ServerException(message: 'Sifre cok uzun (max 256 karakter)');
    }

    _serverUrl = serverUrl.endsWith('/') ? serverUrl.substring(0, serverUrl.length - 1) : serverUrl;
    _username = Uri.encodeComponent(username);
    _password = Uri.encodeComponent(password);
  }

  void clearCredentials() {
    _serverUrl = '';
    _username = '';
    _password = '';
    _visitedUrls.clear();
    _lastRefreshTimes.clear();
  }

  /// Check if a background refresh should be skipped (rate limiting)
  bool shouldSkipRefresh(String cacheKey, {Duration cooldown = const Duration(minutes: 5)}) {
    final lastRefresh = _lastRefreshTimes[cacheKey];
    if (lastRefresh != null && DateTime.now().difference(lastRefresh) < cooldown) {
      return true;
    }
    _lastRefreshTimes[cacheKey] = DateTime.now();
    return false;
  }

  /// Resolves redirects (e.g. tinyurl) and updates _serverUrl with the final URL.
  /// Follows redirect chain manually with SSRF protection.
  Future<void> resolveServerUrl() async {
    if (_isResolving) return;
    if (Uri.tryParse(_serverUrl) == null) return;

    _isResolving = true;
    try {
      var url = _serverUrl;
      _visitedUrls.clear();
      _visitedUrls.add(url);
      // Also add variant with/without trailing slash
      _visitedUrls.add(url.endsWith('/') ? url.substring(0, url.length - 1) : '$url/');

      for (var i = 0; i < 5; i++) {
        final response = await _dio.head<dynamic>(
          url,
          options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
            receiveTimeout: const Duration(seconds: 10),
          ),
        );

        final statusCode = response.statusCode ?? 0;
        if (statusCode < 300 || statusCode >= 400) break;

        final location = response.headers.value('location');
        if (location == null || location.isEmpty) break;

        final nextUrl = Uri.parse(url).resolve(location).toString();
        final cleanNext = nextUrl.endsWith('/')
            ? nextUrl.substring(0, nextUrl.length - 1)
            : nextUrl;

        // SSRF protection: detect redirect loops
        if (_visitedUrls.contains(cleanNext)) break;
        _visitedUrls.add(cleanNext);
        _visitedUrls.add('$cleanNext/');

        // SSRF protection: block private/internal IPs
        if (_isPrivateUrl(cleanNext)) {
          throw const ServerException(
            message: 'Sunucu dahili bir adrese yonlendiriliyor. Guvenlik nedeniyle engellendi.',
          );
        }

        // Check if redirect target is a valid Xtream API server
        if (await _isValidXtreamServer(cleanNext)) {
          _serverUrl = cleanNext;
          return;
        }

        url = cleanNext;
      }

      // Final check on the last URL in chain
      final cleanUrl =
          url.endsWith('/') ? url.substring(0, url.length - 1) : url;
      if (cleanUrl != _serverUrl) {
        if (await _isValidXtreamServer(cleanUrl)) {
          _serverUrl = cleanUrl;
        }
      }
    } catch (e) {
      if (e is ServerException) rethrow;
    } finally {
      _isResolving = false;
    }
  }

  /// Check if URL points to private/internal network
  bool _isPrivateUrl(String urlStr) {
    try {
      final uri = Uri.parse(urlStr);
      final host = uri.host;
      // Block common private IP ranges
      if (host == 'localhost' || host == '127.0.0.1' || host == '::1') return true;
      if (host.startsWith('10.')) return true;
      if (host.startsWith('192.168.')) return true;
      if (RegExp(r'^172\.(1[6-9]|2[0-9]|3[0-1])\.').hasMatch(host)) return true;
      if (host.startsWith('169.254.')) return true;
      if (host == '0.0.0.0') return true;
      return false;
    } catch (_) {
      return true;
    }
  }

  /// Tests whether [baseUrl] hosts a valid Xtream Codes API.
  Future<bool> _isValidXtreamServer(String baseUrl) async {
    try {
      final testUrl =
          '$baseUrl/player_api.php?username=$_username&password=$_password';
      final resp = await _dio.get<dynamic>(
        testUrl,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          receiveTimeout: const Duration(seconds: 5),
        ),
      );
      return resp.data is Map<String, dynamic>;
    } catch (_) {
      return false;
    }
  }

  String get serverUrl => _serverUrl;
  String get username => _username;
  String get password => _password;
  bool get hasCredentials => _serverUrl.isNotEmpty && _username.isNotEmpty;

  String _buildUrl(String action) =>
      '$_serverUrl/player_api.php?username=$_username&password=$_password&action=$action';

  String get authUrl =>
      '$_serverUrl/player_api.php?username=$_username&password=$_password';

  // Stream URL builders
  String liveStreamUrl(int streamId, {String extension = 'm3u8'}) =>
      '$_serverUrl/live/$_username/$_password/$streamId.$extension';

  String vodStreamUrl(int streamId, String containerExtension) =>
      '$_serverUrl/movie/$_username/$_password/$streamId.$containerExtension';

  String seriesStreamUrl(int streamId, String containerExtension) =>
      '$_serverUrl/series/$_username/$_password/$streamId.$containerExtension';

  // ── Auth ──
  Future<Map<String, dynamic>> authenticate() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(authUrl);
      final data = response.data!;
      if (data['user_info']?['auth'] == 0) {
        throw const AuthException(message: 'Kullanici adi veya sifre hatali', code: 'INVALID_CREDENTIALS');
      }
      return data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ── Live TV ──
  Future<List<dynamic>> getLiveCategories() async {
    try {
      final response = await _dio.get<List<dynamic>>(_buildUrl('get_live_categories'));
      return response.data ?? [];
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<dynamic>> getLiveStreams({String? categoryId}) async {
    try {
      var url = _buildUrl('get_live_streams');
      if (categoryId != null) url += '&category_id=${Uri.encodeComponent(categoryId)}';
      final response = await _dio.get<List<dynamic>>(url);
      return response.data ?? [];
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ── VOD ──
  Future<List<dynamic>> getVodCategories() async {
    try {
      final response = await _dio.get<List<dynamic>>(_buildUrl('get_vod_categories'));
      return response.data ?? [];
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<dynamic>> getVodStreams({String? categoryId}) async {
    try {
      var url = _buildUrl('get_vod_streams');
      if (categoryId != null) url += '&category_id=${Uri.encodeComponent(categoryId)}';
      final response = await _dio.get<List<dynamic>>(url);
      return response.data ?? [];
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> getVodInfo(int vodId) async {
    try {
      final url = '${_buildUrl('get_vod_info')}&vod_id=$vodId';
      final response = await _dio.get<Map<String, dynamic>>(url);
      return response.data ?? {};
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ── Series ──
  Future<List<dynamic>> getSeriesCategories() async {
    try {
      final response = await _dio.get<List<dynamic>>(_buildUrl('get_series_categories'));
      return response.data ?? [];
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<dynamic>> getSeries({String? categoryId}) async {
    try {
      var url = _buildUrl('get_series');
      if (categoryId != null) url += '&category_id=${Uri.encodeComponent(categoryId)}';
      final response = await _dio.get<List<dynamic>>(url);
      return response.data ?? [];
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> getSeriesInfo(int seriesId) async {
    try {
      final url = '${_buildUrl('get_series_info')}&series_id=$seriesId';
      final response = await _dio.get<Map<String, dynamic>>(url);
      return response.data ?? {};
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ── EPG ──
  Future<Map<String, dynamic>> getShortEpg(int streamId, {int limit = 4}) async {
    try {
      final url = '${_buildUrl('get_short_epg')}&stream_id=$streamId&limit=$limit';
      final response = await _dio.get<Map<String, dynamic>>(url);
      return response.data ?? {};
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> getSimpleDataTable(int streamId) async {
    try {
      final url = '${_buildUrl('get_simple_data_table')}&stream_id=$streamId';
      final response = await _dio.get<Map<String, dynamic>>(url);
      return response.data ?? {};
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Centralized DioException handler - sanitizes error messages
  ServerException _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    String message;
    if (statusCode == 404) {
      message = 'Sunucu bulunamadi. Lutfen sunucu URL\'sini kontrol edin.';
    } else if (statusCode == 403) {
      message = 'Erisim reddedildi. Hesabiniz aktif olmayabilir.';
    } else if (statusCode != null && statusCode >= 500) {
      message = 'Sunucu hatasi ($statusCode). Lutfen daha sonra tekrar deneyin.';
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      message = 'Sunucuya baglanılamıyor. Lutfen internet baglantinizi kontrol edin.';
    } else {
      // Sanitized message - no raw exception details
      message = 'Baglanti hatasi. Lutfen tekrar deneyin.';
    }
    return ServerException(message: message, statusCode: statusCode);
  }
}
