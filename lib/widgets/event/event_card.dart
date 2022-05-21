import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/constants/assets.dart';
import 'package:socialife/routes/router.gr.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.backgroundImage,
    required this.id,
  }) : super(key: key);

  final Image backgroundImage;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(EventRoute(eventId: id)),
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 0, right: 14),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(children: [
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: 'event $id',
              child: backgroundImage,
            ),
          ),
        ]),
      ),
    );
  }
}
