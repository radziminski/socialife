import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/ticket/entity/ticket.entity.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  const TicketCard({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          AutoRouter.of(context).push(TicketRoute(ticketId: ticket.id)),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(ticket.type.title),
          ],
        ),
      ),
    );
  }
}
