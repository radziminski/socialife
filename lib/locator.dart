import 'package:get_it/get_it.dart';
import 'package:socialife/services/tokens/tokens_service.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/secure-storage/secure_storage.dart';
import 'package:socialife/store/create_event.model.dart';
import 'package:socialife/store/delete_event.model.dart';
import 'package:socialife/store/edit_event.model.dart';
import 'package:socialife/store/event.model.dart';
import 'package:socialife/store/like_event.model.dart';
import 'package:socialife/store/organization_event.model.dart';
import 'package:socialife/store/payment.model.dart';
import 'package:socialife/store/ticket.model.dart';
import 'package:socialife/store/unlike_event.model.dart';
import 'package:socialife/store/user_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerSingleton(SecureStorageServiceSingleton());
  locator.registerSingleton(TokensServiceSingleton());
  locator.registerSingleton(RequestServiceSingleton());

  // Models
  locator.registerSingleton(UserModelSingleton());
  locator.registerLazySingleton(() => EventModelSingleton());
  locator.registerLazySingleton(() => TicketModelSingleton());
  locator.registerLazySingleton(() => PaymentModelSingleton());
  locator.registerLazySingleton(() => OrganizationEventModelSingleton());
  locator.registerLazySingleton(() => CreateEventModelSingleton());
  locator.registerLazySingleton(() => EditEventModelSingleton());
  locator.registerLazySingleton(() => DeleteEventModelSingleton());
  locator.registerLazySingleton(() => LikeEventModelSingleton());
  locator.registerLazySingleton(() => UnlikeEventModelSingleton());
}
