import 'package:socialife/locator.dart';
import 'package:socialife/services/ticket/api/get_ticket.request.dart';
import 'package:socialife/services/ticket/api/get_user_tickets.dart';
import 'package:socialife/services/ticket/entity/ticket.entity.dart';
import 'package:socialife/store/base_api.model.dart';

class TicketModelSingleton extends BaseApiModel<Ticket> {
  TicketModelSingleton()
      : super(fetchItem: getTicket, fetchList: getUserTickets);
}

// ignore: non_constant_identifier_names
final TicketModel = locator<TicketModelSingleton>();
