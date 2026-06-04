import 'package:flutter/material.dart';

class AppSolidButton extends StatelessWidget {
  const AppSolidButton({super.key, required this.title, this.onTap});

  final String title;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12);
    final backgroundColor = Colors.blue;
    final splashColor = Colors.black.withAlpha(45);

    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        splashColor: splashColor,
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
