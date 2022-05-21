import 'package:socialife/locator.dart';
import 'package:socialife/services/secure-storage/secure_storage.dart';

/// Singleton
class AuthService {
  static const _accessTokenKey = 'access_token';
  final _secureStorageService = locator<SecureStorageService>();
  String? accessToken;
  bool isAuthenticated = false;

  AuthService() {
    _readAndProcessAccessToken();
  }

  Future setAccessToken(String newAccessToken) async {
    await _secureStorageService.save(_accessTokenKey, newAccessToken);
    accessToken = newAccessToken;
    isAuthenticated = true;
  }

  Future<String?> _getAccessToken() async {
    try {
      final readAccessToken = await _secureStorageService.read(_accessTokenKey);
      return readAccessToken;
    } catch (_) {
      return null;
    }
  }

  Future _readAndProcessAccessToken() async {
    final readAccessToken = await _getAccessToken();

    if (readAccessToken == null) {
      isAuthenticated = false;
      accessToken = null;
      return;
    }

    accessToken = readAccessToken;
    isAuthenticated = true;
  }
}
