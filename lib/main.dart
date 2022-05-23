import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/routes/router.gr.dart';
import 'package:socialife/styles/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'SociaLife',
      theme: kDarkTheme,
    );
  }
}
