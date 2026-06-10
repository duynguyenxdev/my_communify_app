import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/features/dashboard/widgets/bottom_bar_item.dart';

class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({
    super.key,
    this.children = const [],
    this.selectedIndex = 0,
  });

  final List<BottomBarItem> children;
  final int selectedIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            offset: Offset(0, 4),
            blurRadius: 16,
            spreadRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: widget.children
            .map((child) => Expanded(child: child))
            .toList(),
      ),
    );
  }
}
