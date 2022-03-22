import 'package:flutter/material.dart';
import 'package:socialife/constants/assets.dart';
import 'package:socialife/widgets/layout/screen_wrapper.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'asset1',
            child: Image.asset(kEventMock1),
          ),
        ],
      ),
    );
  }
}
