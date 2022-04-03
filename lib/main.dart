import 'package:flutter/material.dart';
import 'package:socialife/pages/splash.dart';
import 'package:socialife/styles/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socialife',
      theme: kDarkTheme,
      home: const SplashPage(),
    );
  }
}
