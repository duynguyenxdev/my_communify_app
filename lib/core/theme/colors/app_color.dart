import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/theme/colors/light_color.dart';
import 'package:my_communify/core/theme/theme_provider.dart';

abstract class AppColor {
  final Color primary;
  final Color onPrimary;
  final Color background;
  final Color backgroundMuted;
  final Color textMuted;
  final Color textPrimary;
  final Color border;

  AppColor({
    required this.primary,
    required this.onPrimary,
    required this.background,
    required this.backgroundMuted,
    required this.textMuted,
    required this.textPrimary,
    required this.border,
  });

  static AppColor watch(WidgetRef ref) {
    return ref.watch(
      themeProvider.select((s) => s.value?.colors ?? lightColor),
    );
  }
}
