import 'package:socialife/services/ticket/entity/ticket.entity.dart';

String getTicketQRString(Ticket ticket) {
  return '${ticket.id};${ticket.type.id};${ticket.secret}';
}
