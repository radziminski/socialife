import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/ticket/response/event_stats.response.dart';

Future<EventStatsResponse> getEventStats(int eventId) async {
  final json = await request(
    route: getEventStatsRoute(eventId),
  );

  return EventStatsResponse(json);
}
