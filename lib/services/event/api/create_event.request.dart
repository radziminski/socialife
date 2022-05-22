import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/event/dto/create_event.dto.dart';
import 'package:socialife/services/event/entity/event.entity.dart';

Future<Event> createEvent(CreateEventDto dto) async {
  final json = await request(
    route: getEventsRoute(),
    method: RequestMethod.post,
    payload: dto.toJson(),
  );

  return Event(json, isFull: true);
}
