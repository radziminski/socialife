import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socialife/styles/colors.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({
    Key? key,
    this.child,
    this.preventPop = false,
    this.unfocusOnTap = false,
    this.onWillPop,
    this.topPadding = 20,
  }) : super(key: key);

  final Widget? child;
  final bool preventPop;
  final bool unfocusOnTap;
  final Future<bool> Function()? onWillPop;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    Widget body = Scaffold(
      backgroundColor: kBackgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: child ?? Container(),
          ),
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
