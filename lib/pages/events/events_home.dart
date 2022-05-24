// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/widgets/event/event_card.dart';
import 'package:socialife/widgets/event/event_horizontal_scroll.dart';
import 'package:socialife/widgets/guards/redirect_for_organization.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/providers/event_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class EventsHomePage extends StatelessWidget {
  const EventsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: RedirectForOrganization(
        onRedirect: (context) {
          AutoRouter.of(context).push(EventsOrganizationHomeRoute());
        },
        child: ListView(
          children: [
            PageHeader(title: 'Events'),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: kCardHeight,
              child: EventProvider(
                key: const Key('EventsHomePage-EventsList'),
                isListProvider: true,
                builder: (context, model, _) => EventHorizontalScroll(
                  events: model.itemsList,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
