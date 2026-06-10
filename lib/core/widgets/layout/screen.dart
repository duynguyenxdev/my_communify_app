import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.child,
    this.title,
    this.showAppBar = true,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final String? title;
  final bool showAppBar;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;
    return Scaffold(
      appBar: showAppBar
          ? AppBar(title: title != null ? Text(title!) : null)
          : null,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: viewPadding.bottom + padding.bottom,
          left: padding.left,
          right: padding.right,
          top: padding.top,
        ),
        child: child,
      ),
    );
  }
}
