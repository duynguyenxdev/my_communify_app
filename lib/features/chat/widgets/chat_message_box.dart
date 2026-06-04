import 'package:flutter/material.dart';
import 'package:my_communify/features/chat/models/chat_message.dart';

class ChatMessageBox extends StatelessWidget {
  const ChatMessageBox({
    super.key,
    required this.message,
    required this.backgroundColor,
  });

  final ChatMessage message;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      constraints: BoxConstraints(maxWidth: size.width * 0.75),
      child: SelectableText(message.message),
    );
  }
}
