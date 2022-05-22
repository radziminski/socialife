import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/ticket/entity/ticket.entity.dart';

Future<Ticket> getTicket(int ticketId) async {
  final json = await request(
    route: getTicketInstanceRoute(ticketId),
  );

  return Ticket(json);
}
