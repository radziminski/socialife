import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/ticket/entity/ticket.entity.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/utils/date.utils.dart';
import 'package:socialife/widgets/ticket/ticket_field.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  const TicketCard({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: kWhiteColor.withOpacity(0.95),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      color: kPrimaryColor,
                      padding: const EdgeInsets.all(6),
                      child: const Text(
                        'Concert',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Share.share(
                        'I\'m going to ${ticket.type.event?.title}! Join me on ${formatDateTime(ticket.type.event?.startDate)}',
                      );
                    },
                    icon: const Icon(
                      Icons.share,
                      color: kPrimaryColor,
                    ),
                    splashRadius: 20,
                  ),
                ],
              ),
              Text(
                ticket.type.event?.title ?? '',
                style: const TextStyle(
                  color: kGray10Color,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              const Text(
                'Show QR of this ticket at the entrance',
                style: TextStyle(
                  color: kGray50Color,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  color: kGray60Color,
                  width: double.infinity,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TicketField(
                label: 'Place',
                value: ticket.type.event?.locationName ??
                    ticket.type.event?.locationRef,
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TicketField(
                      label: 'Start time',
                      value: formatDateTime(ticket.type.event?.startDate),
                    ),
                  ),
                  Expanded(
                    child: TicketField(
                      label: 'End time',
                      value: formatDateTime(ticket.type.event?.endDate),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TicketField(
                      label: 'Cost',
                      value: '\$' + ticket.type.price.toString(),
                    ),
                  ),
                  Expanded(
                    child: TicketField(
                      label: 'Type',
                      value: ticket.type.title,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 84,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context)
                          .push(TicketRoute(ticketId: ticket.id));
                    },
                    child: const Text('Show QR Code',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: -12,
          bottom: 80,
          child: Container(
            width: 30,
            height: 36,
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
        ),
        Positioned(
          right: -12,
          bottom: 80,
          child: Container(
            width: 30,
            height: 36,
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
