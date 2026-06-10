import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LocalStorageKey { isFirstRun, themeMode }

@singleton
class LocalStorage {
  final _prefs = SharedPreferencesAsync();

  Future<void> setBool(LocalStorageKey key, bool value) {
    return _prefs.setBool(key.name, value);
  }

  Future<void> setString(LocalStorageKey key, String value) {
    return _prefs.setString(key.name, value);
  }

  Future<bool?> getBool(LocalStorageKey key) {
    return _prefs.getBool(key.name);
  }

  Future<String?> getString(LocalStorageKey key) {
    return _prefs.getString(key.name);
  }

  Future<void> remove(LocalStorageKey key) {
    return _prefs.remove(key.name);
  }
}
