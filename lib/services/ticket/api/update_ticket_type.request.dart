import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/ticket/dto/update_ticket_type.dart';
import 'package:socialife/services/ticket/entity/ticket_type.entity.dart';

Future<TicketType> updateTicketType(
  int eventId,
  int ticketTypeId,
  UpdateTicketTypeDto dto,
) async {
  final json = await request(
    route: getTicketTypeRoute(eventId, ticketTypeId),
    method: RequestMethod.patch,
    payload: dto.toJson(),
  );

  return TicketType(json);
}
