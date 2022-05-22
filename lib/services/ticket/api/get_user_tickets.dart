import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/api.utils.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/ticket/entity/ticket.entity.dart';

Future<List<Ticket>> getUserTickets() async {
  final json = await request(
    route: getTicketInstancesRoute(),
  );

  return parseList(json, (json) => Ticket(json));
}
