import 'package:socialife/services/api/api.utils.dart';
import 'package:socialife/types.dart';

class TicketPriceResponse {
  late int ticketTypeId;
  late int price;

  TicketPriceResponse(Json json) {
    ticketTypeId = json['ticketTypeId'];
    price = json['price'];
  }
}

class PotentialPaymentResponse {
  late int netPrice;
  late int fees;
  late double vat;
  late int totalPrice;
  List<TicketPriceResponse> ticketPrices = [];

  PotentialPaymentResponse(Json json) {
    netPrice = json['netPrice'];
    fees = json['fees'];
    vat = json['vat'];
    totalPrice = json['totalPrice'];
    ticketPrices = parseList(
      json['ticketPrices'],
      (json) => TicketPriceResponse(json),
    );
  }
}
