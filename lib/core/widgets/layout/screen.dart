import 'package:flutter/material.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({
    super.key,
    required this.child,
    this.title,
    this.titleWidget,
    this.showAppBar = true,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final String? title;
  final Widget? titleWidget;
  final bool showAppBar;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;
    return Scaffold(
      appBar: showAppBar
          ? AppBar(title: title != null ? Text(title!) : titleWidget)
          : null,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: viewPadding.bottom,
          left: padding.left,
          right: padding.right,
          top: padding.top,
        ),
        child: child,
      ),
    );
  }
}
