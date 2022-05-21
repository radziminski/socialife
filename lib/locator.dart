import 'package:get_it/get_it.dart';
import 'package:socialife/services/auth/auth.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/secure-storage/secure_storage.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(SecureStorageService());
  locator.registerSingleton(RequestService());
  locator.registerSingleton(AuthService());
}
