import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/assets/assets.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';

class ConversationsEmpty extends ConsumerWidget {
  const ConversationsEmpty({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColor.watch(ref);

    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset(Assets.image.empty, width: 72),
          SizedBox(height: 12),
          Text(
            "There's no messages",
            style: TextStyle(color: colors.textMuted),
          ),
        ],
      ),
    );
  }
}
