import 'package:flutter/material.dart';

MaterialColor toMaterialColor(Color color) {
  Map<int, Color> colorsMap = {
    50: color.withOpacity(.05),
    100: color.withOpacity(.1),
    200: color.withOpacity(.2),
    300: color.withOpacity(.3),
    400: color.withOpacity(.4),
    500: color.withOpacity(.5),
    600: color.withOpacity(.6),
    700: color.withOpacity(.7),
    800: color.withOpacity(.8),
    900: color.withOpacity(.9),
  };

  return MaterialColor(color.hashCode, colorsMap);
}
