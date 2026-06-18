import 'package:flutter/widgets.dart';

class SplashScreenManager {
  static WidgetsBinding? _widgetsBinding;

  static void show(WidgetsBinding widgetsBinding) {
    _widgetsBinding = widgetsBinding;
    widgetsBinding.deferFirstFrame();
  }

  static void dismiss() {
    _widgetsBinding?.allowFirstFrame();
  }
}
