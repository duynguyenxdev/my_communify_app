import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.title, this.onTap, this.prefix});

  final String title;

  final VoidCallback? onTap;

  final Widget? prefix;

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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefix != null)
                Padding(padding: EdgeInsets.only(right: 8), child: prefix!),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
