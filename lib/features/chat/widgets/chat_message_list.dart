import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';
import 'package:my_communify/features/chat/models/chat_message.dart';
import 'package:my_communify/features/chat/widgets/chat_message_box.dart';

class ChatMessageList extends ConsumerStatefulWidget {
  const ChatMessageList({super.key, this.messages = const []});

  final List<ChatMessage> messages;

  @override
  ConsumerState<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends ConsumerState<ChatMessageList> {
  final _scrollController = ScrollController();

  bool _isMyMessage(ChatMessage message) {
    final currentUserId = ref.read(
      authProvider.select((s) => s.value?.user?.id),
    );
    return currentUserId == message.senderId;
  }

  Widget _itemBuilder(AppColor colors, BuildContext context, int index) {
    final message = widget.messages[index];
    final isMyMessage = _isMyMessage(message);
    final mainAxisAlignment = isMyMessage
        ? MainAxisAlignment.end
        : MainAxisAlignment.start;
    final backgroundColor = isMyMessage
        ? colors.primary
        : colors.backgroundMuted;
    final textColor = isMyMessage ? colors.onPrimary : colors.textPrimary;

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        ChatMessageBox(
          key: ValueKey(message.id),
          message: message,
          backgroundColor: backgroundColor,
          textColor: textColor,
        ),
      ],
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    if (index == widget.messages.length - 1) {
      return SizedBox.shrink();
    }
    return SizedBox(height: 8);
  }

  @override
  void didUpdateWidget(covariant ChatMessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages.length > oldWidget.messages.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColor.watch(ref);

    return ListView.separated(
      controller: _scrollController,
      itemCount: widget.messages.length,
      padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      separatorBuilder: _separatorBuilder,
      itemBuilder: (context, index) => _itemBuilder(colors, context, index),
    );
  }
}
