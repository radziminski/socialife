import 'package:flutter/material.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    Key? key,
    this.child,
    this.preventPop = false,
    this.unfocusOnTap = false,
    this.onWillPop,
  }) : super(key: key);

  final Widget? child;
  final bool preventPop;
  final bool unfocusOnTap;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    Widget body = Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: child ?? Container(),
        ),
      ),
    );

    if (unfocusOnTap) {
      body = GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: body,
      );
    }

    if (preventPop) {
      body = WillPopScope(
        child: body,
        onWillPop: () async {
          if (onWillPop != null) {
            return onWillPop!();
          }

          return false;
        },
      );
    }

    return body;
  }
}
