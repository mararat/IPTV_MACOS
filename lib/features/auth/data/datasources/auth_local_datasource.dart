import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
  AuthLocalDataSourceImpl(dynamic _);

  static const _serverUrlKey = 'xtream_server_url';
  static const _usernameKey = 'xtream_username';
  static const _passwordKey = 'xtream_password';
  static const _userKey = 'cached_user';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<void> saveCredentials({
    required String serverUrl,
    required String username,
    required String password,
  }) async {
    try {
      final prefs = await _prefs;
      await prefs.setString(_serverUrlKey, serverUrl);
      await prefs.setString(_usernameKey, username);
      await prefs.setString(_passwordKey, password);
    } catch (e) {
      throw const CacheException(message: 'Failed to save credentials');
    }
  }

  @override
  Future<String?> getServerUrl() async {
    final prefs = await _prefs;
    return prefs.getString(_serverUrlKey);
  }

  @override
  Future<String?> getUsername() async {
    final prefs = await _prefs;
    return prefs.getString(_usernameKey);
  }

  @override
  Future<String?> getPassword() async {
    final prefs = await _prefs;
    return prefs.getString(_passwordKey);
  }

  @override
  Future<bool> hasCredentials() async {
    try {
      final prefs = await _prefs;
      final serverUrl = prefs.getString(_serverUrlKey);
      final username = prefs.getString(_usernameKey);
      final password = prefs.getString(_passwordKey);
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
      final prefs = await _prefs;
      await prefs.setString(_userKey, jsonEncode(user));
    } catch (e) {
      throw const CacheException(message: 'Failed to save user');
    }
  }

  @override
  Future<Map<String, dynamic>?> getCachedUser() async {
    try {
      final prefs = await _prefs;
      final encoded = prefs.getString(_userKey);
      if (encoded == null) return null;
      return Map<String, dynamic>.from(jsonDecode(encoded) as Map);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      final prefs = await _prefs;
      await prefs.remove(_serverUrlKey);
      await prefs.remove(_usernameKey);
      await prefs.remove(_passwordKey);
      await prefs.remove(_userKey);
    } catch (e) {
      throw const CacheException(message: 'Failed to clear storage');
    }
  }
}
