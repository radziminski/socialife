import 'package:flutter/material.dart';
import 'package:socialife/routes/router.gr.dart';

class RoutedApp extends StatelessWidget {
  RoutedApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
