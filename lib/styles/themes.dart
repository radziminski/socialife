import 'package:flutter/material.dart';
import 'package:socialife/styles/colors.dart';

const kPrimaryFontFamily = 'Poppins';

final kLightTheme = ThemeData(
  fontFamily: kPrimaryFontFamily,
  primaryColor: kPrimaryColor,
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: kPrimaryFontFamily,
  primaryColor: kPrimaryColor,
  backgroundColor: kBlackColor,
  scaffoldBackgroundColor: kBlackColor,
);
