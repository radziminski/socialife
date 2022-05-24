import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/services/payment/dto/create_payment.dto.dart';
import 'package:socialife/services/payment/dto/potential_payment.dto.dart';
import 'package:socialife/services/payment/entity/payment.entity.dart';
import 'package:socialife/store/make_payment.model.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/error/error_card.dart';
import 'package:socialife/widgets/inputs/text_input.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/providers/api_mutation_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class BuyTicketPage extends StatefulWidget {
  const BuyTicketPage({
    Key? key,
    @PathParam() required this.ticketTypeId,
  }) : super(key: key);

  final int ticketTypeId;

  @override
  State<BuyTicketPage> createState() => _BuyTicketPageState();
}

class _BuyTicketPageState extends State<BuyTicketPage> {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();

  void onSubmit(BuildContext context) {
    locator<MakePaymentModelSingleton>().mutate(
      CreatePaymentDto(
        tickets: [
          PaymentTicketDto(ticketTypeId: widget.ticketTypeId, amount: 1),
        ],
        lastFourDigits: '1234',
        bankName: bankNameController.text,
        paymentMethod: PaymentMethod.card,
      ),
      onSuccess: (_) async {
        await showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  backgroundColor: kBackgroundColor,
                  title: Text('Ticket bought successfully.'),
                ));
        AutoRouter.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: ListView(
        children: [
          const PageHeader(
            title: 'Buying ticket',
            compact: true,
            withBackButton: true,
          ),
          const SizedBox(
            height: 24,
          ),
          PagePadding(
            child: Column(
              children: [
                ApiMutationProvider<MakePaymentModelSingleton>(
                  builder: (context, model, _) => Column(
                    children: [
                      TextInput(
                        controller: bankNameController,
                        label: 'Bank name',
                        placeholder: 'Eg. mBank',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextInput(
                        controller: cardNumberController,
                        label: 'Card number',
                        placeholder: 'Eg. 1234 1234...',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (model.isError)
                        ErrorCard(
                          error: model.error ?? const UnknownException(),
                        ),
                      ButtonPrimary(
                        label: 'Buy!',
                        icon: Icons.shopping_cart_checkout,
                        isLoading: model.isLoading,
                        onPressed: () => onSubmit(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}
