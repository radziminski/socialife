import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/event/event_horizontal_card.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/message/info_message.dart';
import 'package:socialife/widgets/providers/organization_event_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class TicketsScanPage extends StatelessWidget {
  const TicketsScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const PageHeader(title: 'Tickets scan'),
        const SizedBox(height: 16),
        const PagePadding(
          child:
              Text('Choose event for which you want to validate the ticket:'),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: OrganizationEventProvider(
            key: const Key('TicketsScanPage-OrganizationEventProvider'),
            isListProvider: true,
            builder: (context, model, _) => RefreshIndicator(
              onRefresh: () async {
                model.invalidateList();
              },
              color: kPrimaryColor,
              child: ListView(
                children: [
                  model.itemsList != null && model.itemsList!.isNotEmpty
                      ? PagePadding(
                          child: Expanded(
                            child: ColumnWithSpacing(
                              spacing: 0,
                              children: model.itemsList
                                      ?.map(
                                        (event) => EventHorizontalCard(
                                          event: event,
                                          onTap: () {
                                            AutoRouter.of(context).push(
                                                ValidateTicketRoute(
                                                    eventId: event.id));
                                          },
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 500,
                          child: Center(
                            child: InfoMessage(
                                icon: Icons.calendar_month,
                                message: 'You don\t have any events yet'),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
