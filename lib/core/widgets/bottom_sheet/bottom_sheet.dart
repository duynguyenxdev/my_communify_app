import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonBottomSheetOptions {
  final String? title;
  final bool isScrollControlled;

  const CommonBottomSheetOptions({this.title, this.isScrollControlled = true});
}

class CommonBottomSheet extends ConsumerWidget {
  const CommonBottomSheet({
    super.key,
    this.options = const CommonBottomSheetOptions(),
    this.content,
  });

  final CommonBottomSheetOptions options;
  final Widget? content;

  static Future<T?> show<T>({
    required BuildContext context,
    CommonBottomSheetOptions options = const CommonBottomSheetOptions(),
    Widget? Function(BuildContext context)? contentBuilder,
    Widget? content,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: options.isScrollControlled,
      builder: (context) {
        return CommonBottomSheet(
          options: options,
          content:
              content ?? contentBuilder?.call(context) ?? SizedBox.shrink(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final viewPadding = mediaQuery.viewPadding;
    final viewInsets = mediaQuery.viewInsets;
    final contentPadding = 16.0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
        left: contentPadding,
        right: contentPadding,
        bottom: viewPadding.bottom + viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: .start,
        children: [
          SizedBox(
            height: 48,
            child: options.title != null
                ? Center(
                    child: Text(
                      options.title!,
                      style: TextStyle(fontSize: 16, fontWeight: .w600),
                    ),
                  )
                : null,
          ),
          SizedBox(height: 16),
          ?content,
        ],
      ),
    );
  }
}
