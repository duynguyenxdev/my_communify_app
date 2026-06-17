import 'package:flutter/cupertino.dart';

class Unfocusable extends StatelessWidget {
  const Unfocusable({super.key, required this.child});

  final Widget child;

  void _onTap() {
    final primaryFocus = FocusManager.instance.primaryFocus;
    if (primaryFocus != null && primaryFocus.hasFocus) {
      primaryFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: _onTap, child: child);
  }
}
