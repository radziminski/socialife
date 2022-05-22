import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/payment/entity/payment.entity.dart';

Future<Payment> getPayment(int paymentId) async {
  final json = await request(
    route: getPaymentRoute(paymentId),
    method: RequestMethod.get,
  );

  return Payment(json);
}
