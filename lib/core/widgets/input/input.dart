import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';

class Input extends ConsumerStatefulWidget {
  const Input({super.key, this.placeholder, this.suffix});

  final String? placeholder;
  final Widget? suffix;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputState();
}

class _InputState extends ConsumerState<Input> {
  void _onTapOutside() {
    final primaryFocus = FocusManager.instance.primaryFocus;
    if (primaryFocus != null && primaryFocus.hasFocus) {
      primaryFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColor.watch(ref);

    return CupertinoTheme(
      data: CupertinoThemeData(selectionHandleColor: colors.primary),
      child: TextSelectionTheme(
        data: TextSelectionThemeData(
          cursorColor: colors.primary,
          selectionColor: colors.primary.withAlpha(50),
          selectionHandleColor: colors.primary,
        ),
        child: TextField(
          onTapOutside: (_) => _onTapOutside(),
          decoration: InputDecoration(
            hint: widget.placeholder != null
                ? Text(
                    widget.placeholder!,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  )
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(32),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(32),
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            suffixIcon: widget.suffix,
          ),
        ),
      ),
    );
  }
}
