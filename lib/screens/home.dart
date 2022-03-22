import 'package:flutter/material.dart';
import 'package:socialife/constants/assets.dart';
import 'package:socialife/screens/event.dart';
import 'package:socialife/widgets/layout/screen_padding.dart';
import 'package:socialife/widgets/layout/screen_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenPadding(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EventScreen()));
                  },
                  child: Hero(
                    tag: 'asset1',
                    child: SizedBox(
                      height: 200,
                      width: 150,
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
