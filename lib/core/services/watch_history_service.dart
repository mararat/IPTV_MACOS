import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WatchHistoryService {
  WatchHistoryService(this._storage);

  final FlutterSecureStorage _storage;

  static const _keyLive = 'watch_history_live';
  static const _keyVod = 'watch_history_vod';
  static const _keySeries = 'watch_history_series';

  String _keyFor(String type) {
    switch (type) {
      case 'vod':
        return _keyVod;
      case 'series':
        return _keySeries;
      default:
        return _keyLive;
    }
  }

  Future<void> addEntry({
    required String type,
    required String id,
    required String title,
    String? imageUrl,
  }) async {
    final key = _keyFor(type);
    final history = await getHistory(type);

    // Remove duplicate
    history.removeWhere((e) => e['id'] == id);

    // Add to front
    history.insert(0, {
      'id': id,
      'title': title,
      'imageUrl': imageUrl ?? '',
      'timestamp': DateTime.now().toIso8601String(),
    });

    // Keep max 100 entries
    if (history.length > 100) {
      history.removeRange(100, history.length);
    }

    await _storage.write(key: key, value: jsonEncode(history));
  }

  Future<List<Map<String, dynamic>>> getHistory(String type) async {
    final key = _keyFor(type);
    final raw = await _storage.read(key: key);
    if (raw == null || raw.isEmpty) return [];
    final list = jsonDecode(raw) as List;
    return list.cast<Map<String, dynamic>>();
  }

  Future<int> getCount(String type) async {
    final history = await getHistory(type);
    return history.length;
  }

  Future<void> clearHistory(String type) async {
    final key = _keyFor(type);
    await _storage.delete(key: key);
  }

  Future<void> clearAll() async {
    await _storage.delete(key: _keyLive);
    await _storage.delete(key: _keyVod);
    await _storage.delete(key: _keySeries);
  }
}
