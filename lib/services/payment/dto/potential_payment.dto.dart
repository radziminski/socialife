import 'package:socialife/services/api/dto/base.dto.dart';
import 'package:socialife/services/payment/entity/payment.entity.dart';
import 'package:socialife/types.dart';

class PaymentTicketDto extends BaseDto {
  late int ticketTypeId;
  late int amount;

  PaymentTicketDto({required this.ticketTypeId, required this.amount});

  @override
  Json toJson() {
    return {
      'ticketTypeId': ticketTypeId,
      'amount': amount,
    };
  }
}

class PotentialPaymentDto extends BaseDto {
  late PaymentMethod paymentMethod;
  late List<PaymentTicketDto> tickets;

  PotentialPaymentDto({required this.paymentMethod, required this.tickets});

  @override
  Json toJson() {
    return {
      'paymentMethod': getPaymentMethodString(paymentMethod),
      'tickets': tickets.map((ticket) => ticket.toJson()).toList(),
    };
  }
}
