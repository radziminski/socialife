import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socialife/constants/debug.dart';
import 'package:socialife/pages/auth/login.dart';
import 'package:socialife/pages/routed_app.dart';
import 'package:socialife/widgets/layout/screen_wrapper.dart';
import 'package:socialife/widgets/logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  Future handleNavigate(BuildContext context) {
    if (kIsLoggedIn) {
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RoutedApp(),
        ),
      );
    } else {
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: GestureDetector(
        onTap: () => handleNavigate(context),
        child: const Center(
          child: Hero(
            tag: 'logo',
            child: Logo(),
          ),
        ),
      ),
    );
  }
}
