import 'package:socialife/constants/api_routes.dart';
import 'package:socialife/services/api/request.dart';
import 'package:socialife/services/payment/dto/potential_payment.dto.dart';
import 'package:socialife/services/payment/response/potential_payment.response.dart';

Future<PotentialPaymentResponse> getPotentialPayment(
  PotentialPaymentDto dto,
) async {
  final json = await request(
    route: getPotentialPaymentRoute(),
    method: RequestMethod.post,
    payload: dto.toJson(),
  );

  return PotentialPaymentResponse(json);
}
