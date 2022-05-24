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

final kDialogThemeData = ThemeData.dark().copyWith(
  primaryColor: kPrimaryColor,
  colorScheme: const ColorScheme.dark(
    primary: kPrimaryColor,
    onSurface: kPrimaryColor,
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
  dialogBackgroundColor: kBackgroundColor,
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    ),
  ),
);
