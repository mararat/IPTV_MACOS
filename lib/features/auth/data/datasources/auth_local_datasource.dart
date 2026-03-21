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
  const AuthLocalDataSourceImpl(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

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
      await Future.wait([
        _secureStorage.write(key: _serverUrlKey, value: serverUrl),
        _secureStorage.write(key: _usernameKey, value: username),
        _secureStorage.write(key: _passwordKey, value: password),
      ]);
    } catch (e) {
      throw const CacheException(message: 'Failed to save credentials');
    }
  }

  @override
  Future<String?> getServerUrl() async {
    try {
      return await _secureStorage.read(key: _serverUrlKey);
    } catch (e) {
      throw const CacheException(message: 'Failed to read server URL');
    }
  }

  @override
  Future<String?> getUsername() async {
    try {
      return await _secureStorage.read(key: _usernameKey);
    } catch (e) {
      throw const CacheException(message: 'Failed to read username');
    }
  }

  @override
  Future<String?> getPassword() async {
    try {
      return await _secureStorage.read(key: _passwordKey);
    } catch (e) {
      throw const CacheException(message: 'Failed to read password');
    }
  }

  @override
  Future<bool> hasCredentials() async {
    try {
      final serverUrl = await _secureStorage.read(key: _serverUrlKey);
      final username = await _secureStorage.read(key: _usernameKey);
      final password = await _secureStorage.read(key: _passwordKey);
      return serverUrl != null &&
          serverUrl.isNotEmpty &&
          username != null &&
          username.isNotEmpty &&
          password != null &&
          password.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> saveUser(Map<String, dynamic> user) async {
    try {
      final encoded = jsonEncode(user);
      await _secureStorage.write(key: _userKey, value: encoded);
    } catch (e) {
      throw const CacheException(message: 'Failed to save user');
    }
  }

  @override
  Future<Map<String, dynamic>?> getCachedUser() async {
    try {
      final encoded = await _secureStorage.read(key: _userKey);
      if (encoded == null) return null;

      // Support legacy pipe-delimited format for migration
      if (encoded.startsWith('{')) {
        return Map<String, dynamic>.from(jsonDecode(encoded) as Map);
      }

      // Legacy format migration: pipe-delimited → JSON
      final entries = encoded.split('|').map((e) {
        final parts = e.split('=');
        return MapEntry(parts[0], parts.length > 1 ? parts.sublist(1).join('=') : '');
      });
      final data = Map<String, dynamic>.fromEntries(entries);
      // Re-save in JSON format
      await _secureStorage.write(key: _userKey, value: jsonEncode(data));
      return data;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      throw const CacheException(message: 'Failed to clear storage');
    }
  }
}
