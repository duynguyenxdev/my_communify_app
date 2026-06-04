import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageKey {
  static const isFirstRun = 'is_first_run';
}

@singleton
class LocalStorage {
  final _prefs = SharedPreferencesAsync();

  Future<void> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) {
    return _prefs.getBool(key);
  }
}
