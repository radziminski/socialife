import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/event/entity/event.entity.dart';

Future<Event> getEvent(int eventId) async {
  final json = await request(
    route: getEventRoute(eventId),
  );

  return Event(json, isFull: true);
}
