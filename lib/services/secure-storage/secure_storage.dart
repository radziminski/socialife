import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:socialife/locator.dart';

class SecureStorageServiceSingleton {
  final _storage = const FlutterSecureStorage();

  Future save(String key, String value) async {
    print('Saving access key');
    await _storage.write(key: key, value: value);
    final saved = await _storage.read(key: key);
    print(saved);
  }

  Future<String?> read(String key) {
    print('Reading access key');
    return _storage.read(key: key);
  }

  Future delete(String key) {
    return _storage.delete(key: key);
  }

  Future deleteAll() {
    return _storage.deleteAll();
  }
}

// ignore: non_constant_identifier_names
final SecureStorageService = locator<SecureStorageServiceSingleton>();
