import 'package:get_it/get_it.dart';
import 'package:socialife/services/tokens/tokens_service.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/secure-storage/secure_storage.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(SecureStorageServiceSingleton());
  locator.registerSingleton(RequestServiceSingleton());
  locator.registerSingleton(TokensServiceSingleton());
}
