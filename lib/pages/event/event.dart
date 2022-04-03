import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/constants/assets.dart';
import 'package:socialife/widgets/layout/screen_wrapper.dart';

class EventPage extends StatelessWidget {
  const EventPage({
    Key? key,
    @PathParam() required this.eventId,
  }) : super(key: key);

  final int eventId;

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onVerticalDragEnd: (details) {
              final velocity = details.primaryVelocity ?? 0;
              if (velocity > 800) {
                AutoRouter.of(context).pop();
              }
            },
            child: Hero(
              tag: 'asset1',
              child: Image.asset(kEventMock1),
            ),
          ),
        ],
      ),
    );
  }
}
