import 'package:socialife/locator.dart';
import 'package:socialife/services/payment/api/make_payment.request.dart';
import 'package:socialife/services/payment/dto/create_payment.dto.dart';
import 'package:socialife/services/payment/entity/payment.entity.dart';
import 'package:socialife/store/base_api_mutation.model.dart';
import 'package:socialife/store/ticket.model.dart';

class MakePaymentModelSingleton
    extends BaseApiMutationModel<CreatePaymentDto, Payment> {
  MakePaymentModelSingleton()
      : super(
          mutateFn: makePayment,
        );

  @override
  void mutate(
    CreatePaymentDto payload, {
    Function(Payment result)? onSuccess,
    Function(Object error)? onError,
  }) {
    return super.mutate(
      payload,
      onSuccess: (result) {
        locator<TicketModelSingleton>().invalidateList();
        onSuccess?.call(result);
      },
      onError: onError,
    );
  }
}
