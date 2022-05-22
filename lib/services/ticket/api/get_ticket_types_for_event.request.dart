import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/api.utils.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/ticket/entity/ticket_type.entity.dart';

Future<List<TicketType>> getTicketTypesForEvent(int eventId) async {
  final json = await request(
    route: getTicketTypesRoute(eventId),
  );

  return parseList(json, (json) => TicketType(json));
}
