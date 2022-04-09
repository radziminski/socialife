import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({
    Key? key,
    @PathParam() required this.ticketId,
  }) : super(key: key);

  final int ticketId;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ticket Page'),
    );
  }
}
