import 'package:flutter/material.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';

class LightColor extends AppColor {
  LightColor()
    : super(
        primary: Color(0xff21a179),
        onPrimary: Color(0xffffffff),
        textMuted: Color(0xffb8b8b8),
        background: Color(0xffffffff),
        backgroundMuted: Color(0xfff5f5f5),
        textPrimary: Color(0xff1e1e24),
        border: Color(0xffb8b8b8),
      );
}

LightColor get lightColor => LightColor();
