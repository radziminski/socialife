import 'package:flutter/material.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageWrapper(
      child: Center(
        child: Text(
          'TicketsPage - page with tickets of given user - TODO',
        ),
      ),
    );
  }
}
