import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/guards/redirect_for_organization.dart';
import 'package:socialife/widgets/layout/column_with_spacing.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/message/info_message.dart';
import 'package:socialife/widgets/providers/ticket_provider.dart';
import 'package:socialife/widgets/ticket/ticket_card.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RedirectForOrganization(
      onRedirect: (context) {
        AutoRouter.of(context).push(const TicketsScanRoute());
      },
      child: PageWrapper(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const PageHeader(title: 'Tickets'),
          const SizedBox(height: 16),
          Expanded(
            child: TicketProvider(
              key: const Key('TicketsPage-TicketsList'),
              isListProvider: true,
              builder: (context, model, _) => RefreshIndicator(
                onRefresh: () {
                  model.invalidateList();
                  return Future.value();
                },
                color: kPrimaryColor,
                child: ListView(
                  children: [
                    model.itemsList != null && model.itemsList!.isNotEmpty
                        ? PagePadding(
                            child: Expanded(
                              child: ColumnWithSpacing(
                                spacing: 16,
                                children: model.itemsList
                                        ?.map((ticket) =>
                                            TicketCard(ticket: ticket))
                                        .toList() ??
                                    [],
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 500,
                            child: Center(
                              child: InfoMessage(
                                  icon: Icons.discount,
                                  message: 'You don\t have any tickets yet'),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
