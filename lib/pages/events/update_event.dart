import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/event/dto/update_event.dto.dart';
import 'package:socialife/store/edit_event.model.dart';
import 'package:socialife/widgets/forms/event_form.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/providers/api_mutation_provider.dart';
import 'package:socialife/widgets/providers/organization_event_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class UpdateEventPage extends StatelessWidget {
  const UpdateEventPage({
    Key? key,
    @PathParam() required this.eventId,
  }) : super(key: key);

  final int eventId;

  void onSubmit(BuildContext context, UpdateEventDto dto) {
    locator<EditEventModelSingleton>().mutate(UpdateEventArgs(eventId, dto),
        onSuccess: (_) {
      AutoRouter.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: OrganizationEventProvider(
        key: const Key('Event provider on update event page'),
        isItemProvider: true,
        itemId: eventId,
        builder: (context, model, _) => ListView(
          children: [
            PageHeader(
              title: 'Editing "${model.items[eventId]?.title}"',
              compact: true,
              withBackButton: true,
            ),
            const SizedBox(
              height: 24,
            ),
            PagePadding(
              child: ApiMutationProvider<EditEventModelSingleton>(
                builder: (context, mutateModel, _) => EventForm(
                  isSubmitError: mutateModel.isError,
                  isSubmitting: mutateModel.isLoading,
                  submitError: mutateModel.error,
                  onSubmit: (dto) => onSubmit(
                    context,
                    UpdateEventDto.fromCreate(dto),
                  ),
                  initialValues: model.items[eventId]?.toCreateDto(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
