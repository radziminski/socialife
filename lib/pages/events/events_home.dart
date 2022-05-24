// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/widgets/event/event_card.dart';
import 'package:socialife/widgets/event/event_horizontal_card.dart';
import 'package:socialife/widgets/event/event_horizontal_scroll.dart';
import 'package:socialife/widgets/guards/redirect_for_organization.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/message/info_message.dart';
import 'package:socialife/widgets/providers/event_provider.dart';
import 'package:socialife/widgets/typography/page_header.dart';

class EventsHomePage extends StatelessWidget {
  const EventsHomePage({Key? key}) : super(key: key);

  List<Event> getLikedEvents(List<Event>? events) {
    if (events == null) {
      return [];
    }

    return events
        .where(
          (event) => event.likesNumber != null && event.likesNumber! > 0,
        )
        .toList()
        .reversed
        .toList();
  }

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
            ),
            SizedBox(
              height: 16,
            ),
            PagePadding(
              child: Text('Popular events:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            SizedBox(
              height: 8,
            ),
            PagePadding(
              child: EventProvider(
                key: const Key('EventsHomePage-EventsLikedList'),
                isListProvider: true,
                builder: (context, model, _) => Column(
                  children: [
                    if (model.itemsList != null)
                      for (final event in getLikedEvents(model.itemsList))
                        EventHorizontalCard(
                          event: event,
                        ),
                    if (getLikedEvents(model.itemsList).isEmpty)
                      Opacity(
                        opacity: 0.7,
                        child: const SizedBox(
                          height: 100,
                          child: InfoMessage(
                            icon: Icons.star_border_rounded,
                            message: 'You don\'t like any events yer.',
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
