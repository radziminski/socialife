import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/ticket/dto/validate_ticket.dto.dart';
import 'package:socialife/services/ticket/entity/ticket.entity.dart';

Future<Ticket> validateTicket(int eventId, ValidateTicketDto dto) async {
  final json = await request(
    route: getValidateTicketRoute(eventId),
    method: RequestMethod.post,
    payload: dto.toJson(),
  );

  return Ticket(json);
}
