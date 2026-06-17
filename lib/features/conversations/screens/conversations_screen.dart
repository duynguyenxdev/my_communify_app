import 'package:flutter/material.dart';
import 'package:my_communify/features/conversations/widgets/add_conversation_bottom_sheet.dart';
import 'package:my_communify/features/conversations/widgets/conversations_empty.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  void _onTapFab(BuildContext context) {
    AddConversationBottomSheet().show(context: context);
  }

  Widget _buildFab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _onTapFab(context),
      child: Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConversationsEmpty(),
      floatingActionButton: _buildFab(context),
    );
  }
}
