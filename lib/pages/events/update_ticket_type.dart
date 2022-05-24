import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/ticket/dto/update_ticket_type.dto.dart';
import 'package:socialife/store/update_ticket_type.model.dart';
import 'package:socialife/widgets/forms/ticket_type_form.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/providers/api_mutation_provider.dart';
import 'package:socialife/widgets/providers/organization_event_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class UpdateTicketTypePage extends StatelessWidget {
  const UpdateTicketTypePage({
    Key? key,
    @PathParam() required this.eventId,
    @PathParam() required this.ticketTypeId,
  }) : super(key: key);

  final int eventId;
  final int ticketTypeId;

  void onSubmit(BuildContext context, UpdateTicketTypeDto dto) {
    locator<UpdateTicketTypeModelSingleton>().mutate(
      UpdateTicketTypeArgs(
        eventId: eventId,
        ticketTypeId: ticketTypeId,
        dto: dto,
      ),
      onSuccess: (_) => AutoRouter.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: OrganizationEventProvider(
        key: const Key('UpdateTicketType-OrganizationEventProvider'),
        builder: (context, model, _) => ListView(
          children: [
            const PageHeader(
              title: 'Updating ticket type',
              compact: true,
              withBackButton: true,
            ),
            const SizedBox(
              height: 24,
            ),
            PagePadding(
              child: Column(
                children: [
                  ApiMutationProvider<UpdateTicketTypeModelSingleton>(
                    builder: (context, mutateModel, _) => TicketTypeForm(
                      isSubmitError: mutateModel.isError,
                      isSubmitting: mutateModel.isLoading,
                      submitError: mutateModel.error,
                      onSubmit: (dto) => onSubmit(
                        context,
                        dto.toUpdateTicketTypeDto(),
                      ),
                      initialValues: model.items[eventId]?.ticketTypes
                          .firstWhere((type) => type.id == ticketTypeId)
                          .toCreateDto(),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
