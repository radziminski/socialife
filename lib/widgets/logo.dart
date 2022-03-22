import 'package:flutter/material.dart';
import 'package:socialife/constants/assets.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.size = 120}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(kLogo1xAsset),
    );
  }
}
