import 'package:socialife/services/api/api.utils.dart';
import 'package:socialife/services/api/entity/base.entity.dart';
import 'package:socialife/services/ticket/entity/ticket.entity.dart';
import 'package:socialife/types.dart';

enum PaymentMethod {
  card,
  transfer,
  blik,
}

enum PaymentStatus {
  processing,
  paid,
}

class Payment extends BaseEntity {
  late int netPrice;
  late int totalPrice;
  late int? vat;
  late int? fees;
  late String? bankName;
  late String? lastFourDigits;
  late PaymentMethod method;
  late PaymentStatus status;
  late List<Ticket> tickets;

  Payment(Json json) : super(json) {
    netPrice = json['netPrice'];
    totalPrice = json['totalPrice'];
    vat = json['vat'];
    fees = json['fees'];
    bankName = json['bankName'];
    lastFourDigits = json['lastFourDigits'];
    method = getPaymentMethodFromString(json['method']);
    status = getPaymentStatusFromString(json['status']);
    tickets = parseList(json['tickets'], (json) => Ticket(json));
  }
}

String getPaymentMethodString(PaymentMethod method) {
  switch (method) {
    case PaymentMethod.blik:
      return 'blik';
    case PaymentMethod.card:
      return 'card';
    case PaymentMethod.transfer:
      return 'transfer';
  }
}

PaymentMethod getPaymentMethodFromString(String category) {
  switch (category) {
    case 'blik':
      return PaymentMethod.blik;
    case 'card':
      return PaymentMethod.card;
    case 'transfer':
      return PaymentMethod.transfer;
    default:
      return PaymentMethod.card;
  }
}

String getPaymentStatusString(PaymentStatus status) {
  switch (status) {
    case PaymentStatus.paid:
      return 'paid';
    case PaymentStatus.processing:
      return 'processing';
  }
}

PaymentStatus getPaymentStatusFromString(String category) {
  switch (category) {
    case 'paid':
      return PaymentStatus.paid;
    case 'processing':
      return PaymentStatus.processing;
    default:
      return PaymentStatus.processing;
  }
}
