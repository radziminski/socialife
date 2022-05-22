import 'package:socialife/services/api/api.utils.dart';
import 'package:socialife/types.dart';

class EventTicketTypeStatsResponse {
  late int ticketTypeId;
  late int soldTicketsNum;
  late int netPriceEarned;

  EventTicketTypeStatsResponse(Json json) {
    ticketTypeId = json['ticketTypeId'];
    soldTicketsNum = json['soldTicketsNum'];
    netPriceEarned = json['netPriceEarned'];
  }
}

class EventStatsResponse {
  late int totalSoldTicketsNum;
  late int totalNetPriceEarned;
  late int likes;
  List<EventTicketTypeStatsResponse> soldTickets = [];

  EventStatsResponse(Json json) {
    totalSoldTicketsNum = json['totalSoldTicketsNum'];
    totalNetPriceEarned = json['totalNetPriceEarned'];
    likes = json['likes'];
    soldTickets = parseList(
      json['soldTickets'],
      (json) => EventTicketTypeStatsResponse(json),
    );
  }
}
