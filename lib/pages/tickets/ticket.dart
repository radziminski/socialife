import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/ticket/ticket.utils.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/guards/redirect_for_organization.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/providers/ticket_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({
    Key? key,
    @PathParam() required this.ticketId,
  }) : super(key: key);

  final int ticketId;

  @override
  Widget build(BuildContext context) {
    return RedirectForOrganization(
      onRedirect: (context) {
        AutoRouter.of(context).push(const TicketsScanRoute());
      },
      child: PageWrapper(
        child: TicketProvider(
          key: const Key('TicketPage-TicketsList'),
          isItemProvider: true,
          itemId: ticketId,
          builder: (context, model, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(
                title: 'Ticket for ${model.items[ticketId]?.type.event?.title}',
                compact: true,
                withBackButton: true,
              ),
              const SizedBox(height: 16),
              if (model.items[ticketId] != null)
                Expanded(
                  child: Center(
                    child: QrImage(
                      data: getTicketQRString(model.items[ticketId]!),
                      version: QrVersions.auto,
                      size: MediaQuery.of(context).size.width * 0.9,
                      foregroundColor: kWhiteColor,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
