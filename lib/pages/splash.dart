import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/constants/debug.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  Future handleNavigate(BuildContext context) {
    if (kIsLoggedIn) {
      return AutoRouter.of(context).push(const DashboardRoute());
    }

    return AutoRouter.of(context).push(const LoginRoute());
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
