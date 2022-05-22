import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/payment/dto/create_payment.dto.dart';
import 'package:socialife/services/payment/entity/payment.entity.dart';

Future<Payment> makePayment(
  CreatePaymentDto dto,
) async {
  final json = await request(
    route: getPaymentsRoute(),
    method: RequestMethod.post,
    payload: dto.toJson(),
  );

  return Payment(json);
}
