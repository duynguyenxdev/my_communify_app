import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef BottomSheetBuilder = Widget? Function(BuildContext context);

class BottomSheetOptions {
  final String? title;
  final bool isScrollControlled;

  const BottomSheetOptions({this.title, this.isScrollControlled = true});
}

class BottomSheetWidget extends ConsumerWidget {
  const BottomSheetWidget({
    super.key,
    this.options = const BottomSheetOptions(),
    this.content,
  });

  final BottomSheetOptions options;
  final Widget? content;

  Future<T?> show<T>({
    required BuildContext context,
    BottomSheetBuilder? contentBuilder,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: options.isScrollControlled,
      builder: (context) {
        return BottomSheetWidget(
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
