import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';
import 'package:my_communify/features/conversations/widgets/conversation_list.dart';
import 'package:my_communify/features/conversations/widgets/conversations_empty.dart';
import 'package:my_communify/mocks/conversation.dart';
import 'package:my_communify/navigation/nav_path.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider.select((s) => s.value?.user));

    return Scaffold(
      appBar: AppBar(
        title: Text('My workspace'),
        leading: Padding(
          padding: EdgeInsetsGeometry.all(12),
          child: GestureDetector(
            onTap: () {
              context.push(NavPath.profile);
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(user?.avatar ?? ''),
            ),
          ),
        ),
      ),
      body: mockConversations.isEmpty
          ? ConversationsEmpty()
          : ConversationList(conversations: mockConversations),
    );
  }
}
