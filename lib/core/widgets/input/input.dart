import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';

class Input extends ConsumerStatefulWidget {
  const Input({
    super.key,
    this.placeholder,
    this.suffix,
    this.controller,
    this.onChanged,
  });

  final String? placeholder;
  final Widget? suffix;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;

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

    return Stack(
      children: [
        Positioned(
          child: CupertinoTheme(
            data: CupertinoThemeData(selectionHandleColor: colors.primary),
            child: TextSelectionTheme(
              data: TextSelectionThemeData(
                cursorColor: colors.primary,
                selectionColor: colors.primary.withAlpha(50),
                selectionHandleColor: colors.primary,
              ),
              child: TextField(
                controller: widget.controller,
                onChanged: widget.onChanged,
                onTapOutside: (_) => _onTapOutside(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 12,
                    right: 48,
                    top: 16,
                    bottom: 16,
                  ),
                  hint: widget.placeholder != null
                      ? Text(
                          widget.placeholder!,
                          style: TextStyle(
                            color: colors.textMuted,
                            fontSize: 14,
                          ),
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: colors.border),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  filled: true,
                  fillColor: colors.backgroundMuted,
                ),
              ),
            ),
          ),
        ),
        if (widget.suffix != null)
          Positioned(right: 12, top: 0, bottom: 0, child: widget.suffix!),
      ],
    );
  }
}
