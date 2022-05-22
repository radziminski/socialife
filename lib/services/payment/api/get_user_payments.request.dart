import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/api.utils.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/payment/entity/payment.entity.dart';

Future<List<Payment>> getUserPayments() async {
  final json = await request(
    route: getPaymentsRoute(),
    method: RequestMethod.get,
  );

  return parseList(json, (json) => Payment(json));
}
