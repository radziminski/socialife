import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/event/entity/event.entity.dart';

Future<Event> likeEvent(int eventId) async {
  final json = await request(
    route: getLikeEventRoute(eventId),
    method: RequestMethod.post,
  );

  return Event(json, isFull: true);
}
