import 'package:flutter/material.dart';
import 'package:my_communify/features/conversations/models/conversation.dart';
import 'package:my_communify/features/conversations/widgets/conversation_item.dart';

class ConversationList extends StatelessWidget {
  const ConversationList({super.key, this.conversations = const []});

  final List<Conversation> conversations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: _itemBuilder,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final conversation = conversations[index];
    return ConversationItem(
      key: ValueKey(conversation.id),
      conversation: conversation,
    );
  }
}
