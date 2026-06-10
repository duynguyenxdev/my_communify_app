import 'package:flutter/material.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';

class LightColor extends AppColor {
  LightColor()
    : super(
        primary: Colors.green,
        onPrimary: Colors.white,
        textMuted: Colors.grey.shade500,
      );
}
