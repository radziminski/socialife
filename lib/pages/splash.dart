import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialife/constants/debug.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/services/tokens/tokens_service.dart';
import 'package:socialife/store/user_model.dart';
import 'package:socialife/widgets/layout/page_wrapper.dart';
import 'package:socialife/widgets/logo/logo.dart';
import 'package:socialife/widgets/providers/future_content_wrapper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = true;
  bool isError = false;
  BaseException? error;

  @override
  void initState() {
    initializeApp();
    super.initState();
  }

  void initUser() {
    UserModel.getUser(onSuccess: (_) {
      AutoRouter.of(context).push(const DashboardRoute());
    }, onError: (error) {
      if (error is UnauthorizedException) {
        return AutoRouter.of(context).push(const LoginRoute());
      }
      setState(() {
        isError = true;
        isLoading = false;
        if (error is RequestException) {
          setState(() {
            error = error;
          });
        } else {
          setState(() {
            error = AppInitException();
          });
        }
      });
    });
  }

  void initializeApp() async {
    setState(() {
      isLoading = true;
    });
    await TokensService.readAndProcessAccessToken();
    if (kClearCredentials) {
      await TokensService.clearAccessToken();
    }
    initUser();
  }

  Widget _buildLogo(context) {
    return const Center(
      child: Hero(
        tag: 'logo',
        child: Logo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: FutureContentWrapper(
        isLoading: isLoading,
        isError: isError,
        error: error,
        loadingWidget: _buildLogo(context),
        child: _buildLogo(context),
        onReload: initializeApp,
      ),
    );
  }
}
