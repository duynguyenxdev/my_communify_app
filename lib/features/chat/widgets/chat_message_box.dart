import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/features/chat/models/chat_message.dart';

class ChatMessageBox extends ConsumerWidget {
  const ChatMessageBox({
    super.key,
    required this.message,
    required this.backgroundColor,
    required this.textColor,
  });

  final ChatMessage message;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      constraints: BoxConstraints(maxWidth: size.width * 0.75),
      child: SelectableText(
        message.message,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
