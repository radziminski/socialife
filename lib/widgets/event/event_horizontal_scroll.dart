import 'package:flutter/material.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/widgets/event/event_card.dart';

class EventHorizontalScroll extends StatelessWidget {
  final List<Event>? events;
  const EventHorizontalScroll({Key? key, required this.events})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        const SizedBox(
          width: 8,
        ),
        ...events?.map((event) => EventCard(event: event)).toList() ?? []
      ],
    );
  }
}
