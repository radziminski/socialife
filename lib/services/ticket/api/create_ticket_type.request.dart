import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/ticket/dto/create_ticket_type.dto.dart';
import 'package:socialife/services/ticket/entity/ticket_type.entity.dart';

Future<TicketType> createTicketType(
  int eventId,
  CreateTicketTypeDto dto,
) async {
  final json = await request(
    route: getTicketTypesRoute(eventId),
    method: RequestMethod.post,
    payload: dto.toJson(),
  );

  return TicketType(json);
}
