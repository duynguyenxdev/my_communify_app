import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';

class Button extends ConsumerWidget {
  const Button({
    super.key,
    required this.title,
    this.onTap,
    this.prefix,
    this.fullWidth = false,
  });

  final String title;

  final VoidCallback? onTap;

  final Widget? prefix;

  final bool fullWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColor.watch(ref);
    final borderRadius = BorderRadius.circular(32);
    final backgroundColor = colors.primary;
    final splashColor = Colors.black.withAlpha(45);

    return Material(
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        splashColor: splashColor,
        child: Ink(
          width: fullWidth ? double.infinity : null,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: Row(
            mainAxisSize: .min,
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              if (prefix != null)
                Padding(padding: EdgeInsets.only(right: 8), child: prefix!),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: .w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
