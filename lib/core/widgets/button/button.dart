import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';

class CommonButton extends ConsumerWidget {
  const CommonButton({
    super.key,
    required this.title,
    this.onTap,
    this.prefix,
    this.fullWidth = false,
    this.enabled = true,
  });

  final String title;

  final VoidCallback? onTap;

  final Widget? prefix;

  final bool fullWidth;

  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColor.watch(ref);
    final borderRadius = BorderRadius.circular(32);
    final backgroundColor = colors.primary;
    final splashColor = colors.primary.withAlpha(10);

    return Material(
      borderRadius: borderRadius,
      child: InkWell(
        onTap: () {
          if (enabled) onTap?.call();
        },
        borderRadius: borderRadius,
        splashColor: splashColor,
        child: Ink(
          width: fullWidth ? double.infinity : null,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: enabled ? backgroundColor : backgroundColor.withAlpha(50),
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
