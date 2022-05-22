import 'package:flutter/material.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/providers/ticket_provider.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Center(
        child: PageWrapper(
          child: Center(
              child: TicketProvider(
            key: const Key('TicketsPageProvider'),
            isListProvider: true,
            builder: (context, model, _) => ListView(
              scrollDirection: Axis.horizontal,
              children: model.itemsList
                      ?.map(
                        (ticket) => SizedBox(
                          height: 200,
                          child: Column(
                            children: [
                              Text(ticket.id.toString()),
                              Text(ticket.type.title),
                              Text(ticket.secret ?? 'No secret'),
                            ],
                          ),
                        ),
                      )
                      .toList() ??
                  [],
            ),
          )),
        ),
      ),
    );
  }
}
