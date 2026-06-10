import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/theme/colors/light_color.dart';
import 'package:my_communify/core/theme/theme_provider.dart';

abstract class AppColor {
  final Color primary;
  final Color onPrimary;
  final Color textMuted;

  AppColor({
    required this.primary,
    required this.onPrimary,
    required this.textMuted,
  });

  static AppColor watch(WidgetRef ref) {
    return ref.watch(
      themeProvider.select((s) => s.value?.colors ?? LightColor()),
    );
  }
}
