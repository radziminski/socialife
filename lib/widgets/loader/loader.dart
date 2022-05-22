import 'package:flutter/material.dart';
import 'package:socialife/styles/colors.dart';

class Loader extends StatelessWidget {
  final double? scale;
  final double? strokeWidth;
  const Loader({Key? key, this.scale, this.strokeWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale ?? 1,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          strokeWidth: strokeWidth ?? 4,
          valueColor: const AlwaysStoppedAnimation<Color>(
            kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
