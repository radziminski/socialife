// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/constants/assets.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/widgets/api_test.dart';
import 'package:socialife/widgets/layout/page_padding.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';

class EventsHomePage extends StatelessWidget {
  const EventsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PagePadding(
            child: Text(
              'Events',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
            ),
          ),
          ApiTest(),
          SizedBox(
            height: 20,
          ),
          PagePadding(
            child: Text(
              'Search will be here',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          PagePadding(
            child: Text(
              'Filter1,  Filter2,  Filter3,  Filter4',
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 30,
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
