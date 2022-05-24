import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/ticket/dto/create_ticket_type.dto.dart';
import 'package:socialife/store/create_ticket_type.model.dart';
import 'package:socialife/widgets/forms/ticket_type_form.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/providers/api_mutation_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class CreateTicketTypePage extends StatelessWidget {
  const CreateTicketTypePage({
    Key? key,
    @PathParam() required this.eventId,
  }) : super(key: key);

  final int eventId;

  void onSubmit(BuildContext context, CreateTicketTypeDto dto) {
    locator<CreateTicketTypeModelSingleton>().mutate(
      CreateTicketTypeArgs(eventId: eventId, dto: dto),
      onSuccess: (_) => AutoRouter.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: ListView(
        children: [
          const PageHeader(
            title: 'Creating new ticket type',
            compact: true,
            withBackButton: true,
          ),
          const SizedBox(
            height: 24,
          ),
          PagePadding(
            child: Column(
              children: [
                ApiMutationProvider<CreateTicketTypeModelSingleton>(
                  builder: (context, model, _) => TicketTypeForm(
                    isSubmitError: model.isError,
                    isSubmitting: model.isLoading,
                    submitError: model.error,
                    onSubmit: (dto) => onSubmit(
                      context,
                      dto,
                    ),
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
