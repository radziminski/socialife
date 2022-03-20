import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socialife/screens/auth/login.dart';
import 'package:socialife/widgets/layout/screen_wrapper.dart';
import 'package:socialife/widgets/logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future handleNavigate(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
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
