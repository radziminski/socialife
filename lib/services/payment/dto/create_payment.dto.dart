import 'package:socialife/services/payment/dto/potential_payment.dto.dart';
import 'package:socialife/services/payment/entity/payment.entity.dart';
import 'package:socialife/types.dart';

class CreatePaymentDto extends PotentialPaymentDto {
  String bankName;
  String lastFourDigits;

  CreatePaymentDto({
    required PaymentMethod paymentMethod,
    required List<PaymentTicketDto> tickets,
    required this.bankName,
    required this.lastFourDigits,
  }) : super(
          paymentMethod: paymentMethod,
          tickets: tickets,
        );

  @override
  Json toJson() {
    return {
      ...super.toJson(),
      'bankName': bankName,
      'lastFourDigits': lastFourDigits,
    };
  }
}
