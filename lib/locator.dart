import 'package:get_it/get_it.dart';
import 'package:socialife/services/tokens/tokens_service.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/secure-storage/secure_storage.dart';
import 'package:socialife/store/event.model.dart';
import 'package:socialife/store/payment.model.dart';
import 'package:socialife/store/ticket.model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerSingleton(SecureStorageServiceSingleton());
  locator.registerSingleton(RequestServiceSingleton());
  locator.registerSingleton(TokensServiceSingleton());

  // Models
  locator.registerLazySingleton(() => EventModelSingleton());
  locator.registerLazySingleton(() => TicketModelSingleton());
  locator.registerLazySingleton(() => PaymentModelSingleton());
}
