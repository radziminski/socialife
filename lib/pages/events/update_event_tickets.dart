import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/widgets/button/button_primary.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/message/info_message.dart';
import 'package:socialife/widgets/providers/organization_event_provider.dart';
import 'package:socialife/widgets/ticket/ticket_type_card.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class UpdateEventTicketsPage extends StatelessWidget {
  const UpdateEventTicketsPage({
    Key? key,
    @PathParam() required this.eventId,
  }) : super(key: key);

  final int eventId;

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: OrganizationEventProvider(
        key: const Key('OrganizationEvent-UpdateTicketsPage'),
        isItemProvider: true,
        itemId: eventId,
        builder: (context, model, _) => ListView(
          children: [
            PageHeader(
              title: 'Ticket types for "${model.items[eventId]?.title}"',
              compact: true,
              withBackButton: true,
            ),
            const SizedBox(
              height: 24,
            ),
            if (model.items[eventId] != null &&
                model.items[eventId]!.ticketTypes.isNotEmpty)
              PagePadding(
                child: ColumnWithSpacing(
                  spacing: 16,
                  children: model.items[eventId]!.ticketTypes
                      .map(
                        (type) => TicketTypeCard(
                          ticketType: type,
                          canEdit: true,
                          onTap: () {
                            AutoRouter.of(context).push(
                              UpdateTicketTypeRoute(
                                eventId: eventId,
                                ticketTypeId: type.id,
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 300,
                  child: Center(
                    child: InfoMessage(
                      message: 'No ticket types yet.',
                      icon: Icons.local_activity,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 24),
            PagePadding(
              child: ButtonPrimary(
                label: 'Add new ticket type',
                onPressed: () {
                  AutoRouter.of(context).push(
                    CreateTicketTypeRoute(eventId: eventId),
                  );
                },
                icon: Icons.local_activity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
