import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';

class ValidateTicketPage extends StatelessWidget {
  const ValidateTicketPage({
    Key? key,
    @PathParam() required this.eventId,
  }) : super(key: key);

  final int eventId;

  @override
  Widget build(BuildContext context) {
    return const PageWrapper(
      child: Center(
        child: Text(
          'Scanning initialization failed',
        ),
      ),
    );
  }
}
