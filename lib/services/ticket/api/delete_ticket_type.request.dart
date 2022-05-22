import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';

Future<void> deleteTicketType(int eventId, int ticketTypeId) async {
  await request(
    route: getTicketTypesRoute(eventId),
    method: RequestMethod.delete,
  );
}
