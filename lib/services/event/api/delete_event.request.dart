import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';

Future<void> deleteEvent(int eventId) async {
  await request(
    route: getEventRoute(eventId),
    method: RequestMethod.delete,
  );
}
