import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';
import 'package:my_communify/core/widgets/image/svg_image.dart';

class BottomBarItem extends ConsumerWidget {
  const BottomBarItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  final String label;
  final String iconPath;
  final int index;
  final int selectedIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = index == selectedIndex;
    final colors = AppColor.watch(ref);
    final viewPadding = MediaQuery.of(context).padding;

    return Material(
      color: Colors.white,

      child: InkWell(
        onTap: () => onTap(index),
        splashColor: colors.primary.withAlpha(20),
        highlightColor: colors.primary.withAlpha(30),
        child: Padding(
          padding: EdgeInsets.only(bottom: viewPadding.bottom, top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgImage(
                iconPath,
                color: isSelected ? colors.primary : colors.textMuted,
              ),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? colors.primary : colors.textMuted,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
