import 'package:flutter/material.dart';

ThemeData get themeData => ThemeData(
  fontFamily: 'OpenSans',
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    shape: CircleBorder(),
    elevation: 12,
    splashColor: Colors.green.withAlpha(20),
  ),
);
