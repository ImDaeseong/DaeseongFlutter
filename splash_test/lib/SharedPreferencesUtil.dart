import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  static Future<bool> setValue(String key, dynamic value) async {
    final prefs = await _prefs;
    if (value is String) {
      return prefs.setString(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is List<String>) {
      return prefs.setStringList(key, value);
    } else {
      throw UnsupportedError("Unsupported type: ${value.runtimeType}");
    }
  }

  static Future<T?> getValue<T>(String key, [T? defaultValue]) async {
    final prefs = await _prefs;
    switch (T) {
      case String:
        return (prefs.getString(key) ?? defaultValue) as T?;
      case int:
        return (prefs.getInt(key) ?? defaultValue) as T?;
      case bool:
        return (prefs.getBool(key) ?? defaultValue) as T?;
      case double:
        return (prefs.getDouble(key) ?? defaultValue) as T?;
      case const (List<String>):
        return (prefs.getStringList(key) ?? defaultValue) as T?;
      default:
        throw UnsupportedError("Unsupported type: $T");
    }
  }

  static Future<bool> remove(String key) async {
    final prefs = await _prefs;
    return prefs.remove(key);
  }

  static Future<bool> clear() async {
    final prefs = await _prefs;
    return prefs.clear();
  }

  static Future<bool> contains(String key) async {
    final prefs = await _prefs;
    return prefs.containsKey(key);
  }

  static Future<Map<String, Object?>> getAll() async {
    final prefs = await _prefs;
    return prefs.getKeys().fold<Map<String, Object?>>({}, (map, key) {
      map[key] = prefs.get(key);
      return map;
    });
  }
}