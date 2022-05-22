import 'package:flutter/foundation.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/secure-storage/secure_storage.dart';

class TokensServiceSingleton {
  static const _accessTokenKey = 'socialife_access_token';
  final _secureStorageService = SecureStorageService;
  String? accessToken;
  bool isAuthenticated = false;

  TokensServiceSingleton() {
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
    } catch (error) {
      if (kDebugMode) {
        print('Error while reading access token');
        rethrow;
      }
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

// ignore: non_constant_identifier_names
final TokensService = locator<TokensServiceSingleton>();
