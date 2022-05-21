import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Singleton
class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Future save(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  Future delete(String key) {
    return _storage.delete(key: key);
  }

  Future deleteAll() {
    return _storage.deleteAll();
  }
}
