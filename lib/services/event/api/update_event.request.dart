import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/event/dto/update_event.dto.dart';
import 'package:socialife/services/event/entity/event.entity.dart';

Future<Event> updateEvent(int eventId, UpdateEventDto dto) async {
  final json = await request(
    route: getEventRoute(eventId),
    method: RequestMethod.patch,
    payload: dto.toJson(),
  );

  return Event(json, isFull: true);
}
