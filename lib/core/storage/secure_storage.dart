import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

class SecureStorageKey {
  static const accessToken = 'access_token';
}

@singleton
class SecureStorage {
  final _storage = FlutterSecureStorage();

  Future<void> set(String key, String? value) {
    return _storage.write(key: key, value: value);
  }

  Future<String?> get(String key) {
    return _storage.read(key: key);
  }

  Future<void> remove(String key) {
    return _storage.delete(key: key);
  }

  Future<void> clear() {
    return _storage.deleteAll();
  }
}
