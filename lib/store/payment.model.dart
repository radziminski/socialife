import 'package:socialife/locator.dart';
import 'package:socialife/services/payment/api/get_payment.request.dart';
import 'package:socialife/services/payment/api/get_user_payments.request.dart';
import 'package:socialife/services/payment/entity/payment.entity.dart';
import 'package:socialife/store/base_api.model.dart';

class PaymentModelSingleton extends BaseApiModel<Payment> {
  PaymentModelSingleton()
      : super(fetchItem: getPayment, fetchList: getUserPayments);
}

// ignore: non_constant_identifier_names
final PaymentModel = locator<PaymentModelSingleton>();
