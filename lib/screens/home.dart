import 'package:flutter/material.dart';
import 'package:socialife/widgets/layout/screen_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: Column(
        children: const [
          Text(
            'Events',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
