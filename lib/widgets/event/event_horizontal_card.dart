import 'dart:math';

import 'package:flutter/material.dart';
import 'package:socialife/services/event/entity/event.entity.dart';

class EventHorizontalCard extends StatelessWidget {
  final Event event;
  final Function? onTap;

  const EventHorizontalCard({Key? key, required this.event, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            borderRadius: BorderRadius.circular(8),
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
