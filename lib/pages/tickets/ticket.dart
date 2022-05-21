import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({
    Key? key,
    @PathParam() required this.ticketId,
  }) : super(key: key);

  final int ticketId;

  @override
  Widget build(BuildContext context) {
    return const PageWrapper(
      child: Center(
        child: Text(
          'TicketPage - page with details of given ticket',
        ),
      ),
    );
  }
}
