import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

enum SecureStorageKey { accessToken }

@singleton
class SecureStorage {
  final _storage = FlutterSecureStorage();

  Future<void> set(SecureStorageKey key, String? value) {
    return _storage.write(key: key.name, value: value);
  }

  Future<String?> get(SecureStorageKey key) {
    return _storage.read(key: key.name);
  }

  Future<void> remove(SecureStorageKey key) {
    return _storage.delete(key: key.name);
  }

  Future<void> clear() {
    return _storage.deleteAll();
  }
}
