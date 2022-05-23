import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/api.utils.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/event/entity/event.entity.dart';

Future<List<Event>> getMyEvents() async {
  final json = await request(
    route: getMyEventsRoute(),
  );

  return parseList(json, (json) => Event(json, isFull: false));
}
