import 'package:flutter/material.dart';
import 'package:my_communify/core/theme/colors/light_color.dart';

ThemeData get themeData => ThemeData(
  fontFamily: 'OpenSans',
  scaffoldBackgroundColor: lightColor.background,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColor.background,
    titleTextStyle: TextStyle(
      color: lightColor.textPrimary,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    centerTitle: true,
    shape: UnderlineInputBorder(
      borderSide: BorderSide(color: lightColor.border, width: 0.5),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: lightColor.primary,
    foregroundColor: lightColor.onPrimary,
    shape: CircleBorder(),
    elevation: 12,
    splashColor: lightColor.primary.withAlpha(20),
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStatePropertyAll(lightColor.primary),
  ),
);
