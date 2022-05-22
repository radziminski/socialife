import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/event/entity/event.entity.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(EventRoute(eventId: event.id)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 250,
          width: 180,
          decoration: BoxDecoration(
            color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(event.title),
            ],
          ),
        ),
      ),
    );
  }
}
