import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';
import 'package:my_communify/features/conversations/models/conversation.dart';
import 'package:my_communify/navigation/nav_path.dart';

class ConversationItem extends ConsumerWidget {
  const ConversationItem({super.key, required this.conversation});

  final Conversation conversation;

  void _onTap(BuildContext context) {
    context.push(NavPath.chat, extra: conversation.participant);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColor.watch(ref);

    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                conversation.participant.avatar ?? '',
              ),
            ),
            Gap(12),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  conversation.participant.fullName ?? 'Anonymous',
                  style: TextStyle(
                    fontWeight: .bold,
                    color: colors.textPrimary,
                  ),
                ),
                Text(
                  conversation.participant.email,
                  style: TextStyle(
                    fontWeight: .w300,
                    color: colors.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
