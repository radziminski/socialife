import 'package:flutter/material.dart';
import 'package:socialife/styles/colors.dart';

class Loader extends StatelessWidget {
  final double? scale;
  final double? strokeWidth;
  final bool center;
  const Loader({
    Key? key,
    this.scale,
    this.strokeWidth,
    this.center = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indicator = CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      strokeWidth: strokeWidth ?? 4,
      valueColor: const AlwaysStoppedAnimation<Color>(
        kPrimaryColor,
      ),
    );
    return Transform.scale(
      scale: scale ?? 1,
      child: center
          ? Center(
              child: indicator,
            )
          : indicator,
    );
  }
}
