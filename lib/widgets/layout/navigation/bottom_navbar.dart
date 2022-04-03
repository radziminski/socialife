import 'package:flutter/cupertino.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/styles/themes.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  static const TextStyle itemStyle = TextStyle(
    fontFamily: kPrimaryFontFamily,
  );

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: kPrimaryColor,
      items: [
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.calendar),
          title: const Text('Events'),
        ),
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.search),
          title: const Text('Search'),
        ),
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.ticket),
          title: const Text('Tickets'),
        ),
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.person_circle),
          title: const Text('Account'),
        ),
      ],
    );
  }
}
