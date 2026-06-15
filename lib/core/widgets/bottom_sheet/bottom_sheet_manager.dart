import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_communify/navigation/router.dart';

part 'bottom_sheet_widget.dart';

typedef BottomSheetBuilder = Widget? Function(BuildContext context);

class BottomSheetOptions {
  final String? title;
  final bool isScrollControlled;

  const BottomSheetOptions({this.title, this.isScrollControlled = false});
}

class BottomSheetManager {
  static BuildContext? get _rootContext => rootNavigatorKey.currentContext;
  static bool get _mounted => _rootContext?.mounted ?? false;

  static Future<T?> show<T>({
    BuildContext? context,
    BottomSheetOptions options = const BottomSheetOptions(),
    required BottomSheetBuilder builder,
  }) async {
    if (!_mounted) return null;

    final selectedContext = context ?? _rootContext!;
    return showModalBottomSheet(
      context: selectedContext,
      isScrollControlled: options.isScrollControlled,
      builder: (context) {
        return BottomSheetWidget(
          options: options,
          content: builder(selectedContext),
        );
      },
    );
  }
}
