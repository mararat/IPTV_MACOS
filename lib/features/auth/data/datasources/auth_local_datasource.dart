import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iptv_macos/core/error/exceptions.dart';

abstract class AuthLocalDataSource {
  Future<void> saveCredentials({
    required String serverUrl,
    required String username,
    required String password,
  });
  Future<String?> getServerUrl();
  Future<String?> getUsername();
  Future<String?> getPassword();
  Future<bool> hasCredentials();
  Future<void> saveUser(Map<String, dynamic> user);
  Future<Map<String, dynamic>?> getCachedUser();
  Future<void> clearAll();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(FlutterSecureStorage _)
      : _storage = const FlutterSecureStorage(
          mOptions: MacOsOptions(usesDataProtectionKeychain: true),
        );

  final FlutterSecureStorage _storage;

  static const _serverUrlKey = 'xtream_server_url';
  static const _usernameKey = 'xtream_username';
  static const _passwordKey = 'xtream_password';
  static const _userKey = 'cached_user';

  @override
  Future<void> saveCredentials({
    required String serverUrl,
    required String username,
    required String password,
  }) async {
    try {
      await _storage.write(key: _serverUrlKey, value: serverUrl);
      await _storage.write(key: _usernameKey, value: username);
      await _storage.write(key: _passwordKey, value: password);
    } catch (e) {
      throw const CacheException(message: 'Failed to save credentials');
    }
  }

  @override
  Future<String?> getServerUrl() async {
    try { return await _storage.read(key: _serverUrlKey); } catch (_) { return null; }
  }

  @override
  Future<String?> getUsername() async {
    try { return await _storage.read(key: _usernameKey); } catch (_) { return null; }
  }

  @override
  Future<String?> getPassword() async {
    try { return await _storage.read(key: _passwordKey); } catch (_) { return null; }
  }

  @override
  Future<bool> hasCredentials() async {
    try {
      final serverUrl = await _storage.read(key: _serverUrlKey);
      final username = await _storage.read(key: _usernameKey);
      final password = await _storage.read(key: _passwordKey);
      return serverUrl != null && serverUrl.isNotEmpty &&
          username != null && username.isNotEmpty &&
          password != null && password.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> saveUser(Map<String, dynamic> user) async {
    try {
      await _storage.write(key: _userKey, value: jsonEncode(user));
    } catch (e) {
      throw const CacheException(message: 'Failed to save user');
    }
  }

  @override
  Future<Map<String, dynamic>?> getCachedUser() async {
    try {
      final encoded = await _storage.read(key: _userKey);
      if (encoded == null) return null;
      return Map<String, dynamic>.from(jsonDecode(encoded) as Map);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await _storage.delete(key: _serverUrlKey);
      await _storage.delete(key: _usernameKey);
      await _storage.delete(key: _passwordKey);
      await _storage.delete(key: _userKey);
    } catch (e) {
      throw const CacheException(message: 'Failed to clear storage');
    }
  }
}
