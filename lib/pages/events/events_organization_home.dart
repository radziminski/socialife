import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/store/delete_event.model.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/error/error_card.dart';
import 'package:socialife/widgets/event/event_horizontal_scroll.dart';
import 'package:socialife/widgets/event/event_picker.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/layout/prevent_pop.dart';
import 'package:socialife/widgets/loader/loader.dart';
import 'package:socialife/widgets/message/info_message.dart';
import 'package:socialife/widgets/providers/api_mutation_provider.dart';
import 'package:socialife/widgets/providers/organization_event_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class EventsOrganizationHomePage extends StatelessWidget {
  const EventsOrganizationHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreventPop(
      child: PageWrapper(
        child: ListView(
          children: [
            const PageHeader(
              title: 'Events',
            ),
            const SizedBox(
              height: 16,
            ),
            PagePadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome to SociaLife!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'On this page you can manage events belonging to your organization: create new ones or edit the existing ones.',
                    style: TextStyle(
                      color: kGray60Color,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const PagePadding(
              child: Text(
                'Organization events:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 200,
              child: OrganizationEventProvider(
                key: const Key('EventsOrganizationHomePage-EventProvider'),
                isListProvider: true,
                builder: (context, model, _) => model.itemsList != null &&
                        model.itemsList!.isNotEmpty == true
                    ? EventHorizontalScroll(
                        events: model.itemsList,
                      )
                    : const Center(
                        child: InfoMessage(
                          icon: Icons.event,
                          message: 'You don\'t have any events yet',
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            PagePadding(
              child: ColumnWithSpacing(
                spacing: 24,
                children: [
                  ButtonPrimary(
                    label: 'Create new Event',
                    onPressed: () {
                      AutoRouter.of(context).push(const CreateEventRoute());
                    },
                    icon: Icons.add_box_outlined,
                  ),
                  ButtonPrimary(
                    label: 'Edit event',
                    onPressed: () async {
                      final event = await showEventPicker(context);
                      if (event != null) {
                        AutoRouter.of(context).push(
                          UpdateEventRoute(
                            eventId: event.id,
                          ),
                        );
                      }
                    },
                    icon: Icons.edit,
                  ),
                  ButtonPrimary(
                    label: 'Delete event',
                    onPressed: () async {
                      final event = await showEventPicker(context);
                      if (event != null) {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              ApiMutationProvider<DeleteEventModelSingleton>(
                            builder: (context, model, _) => AlertDialog(
                              insetPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              backgroundColor: kBackgroundColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Are you sure about deleting "${event.title}"?',
                                    style: const TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'This action is irreversible.',
                                    style: TextStyle(
                                      color: kGray60Color,
                                      fontSize: 12,
                                    ),
                                  ),
                                  if (model.isError) const SizedBox(height: 16),
                                  if (model.isError)
                                    ErrorCard(
                                      compact: true,
                                      error: model.error ??
                                          const UnknownException(),
                                    ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: kGray60Color,
                                    ),
                                  ),
                                  onPressed: () {
                                    AutoRouter.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: model.isLoading
                                      ? const Loader(
                                          scale: 0.5,
                                          center: false,
                                        )
                                      : const Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: kErrorColor,
                                          ),
                                        ),
                                  onPressed: () {
                                    model.mutate(event.id, onSuccess: (_) {
                                      AutoRouter.of(context).pop();
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 4,
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    icon: Icons.delete,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
