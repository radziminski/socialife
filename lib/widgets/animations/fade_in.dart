import 'dart:async';
import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({
    Key? key,
    this.duration = const Duration(
      milliseconds: 200,
    ),
    this.delay = Duration.zero,
    this.child,
  }) : super(key: key);

  final Duration duration;
  final Duration delay;
  final Widget? child;

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> {
  @override
  void initState() {
    super.initState();
    Timer(widget.delay, () {
      setState(() {
        opacity = 1;
      });
    });
  }

  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: widget.duration,
      child: widget.child,
    );
  }
}
