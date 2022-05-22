import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/event/entity/event.entity.dart';

Future<Event> cancelEvent(int eventId) async {
  final json = await request(
    route: getCancelEventRoute(eventId),
    method: RequestMethod.patch,
  );

  return Event(json, isFull: true);
}
