import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/constants/assets.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/widgets/layout/screen_padding.dart';
import 'package:socialife/widgets/layout/screen_wrapper.dart';

class EventsHomePage extends StatelessWidget {
  const EventsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PagePadding(
            child: Text(
              'Events',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(
                      EventRoute(eventId: 1),
                    );
                  },
                  child: Hero(
                    tag: 'asset1',
                    child: SizedBox(
                      height: 200,
                      child: Image.asset(kEventMock1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(kEventMock2),
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(kEventMock3),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
