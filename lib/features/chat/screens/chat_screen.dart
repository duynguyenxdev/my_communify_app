import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:my_communify/core/di/di.dart';
import 'package:my_communify/core/network/socket_client.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';
import 'package:my_communify/core/widgets/gesture/unfocusable.dart';
import 'package:my_communify/core/widgets/input/text_field.dart';
import 'package:my_communify/core/widgets/layout/screen.dart';
import 'package:my_communify/features/auth/models/user.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';
import 'package:my_communify/features/chat/models/chat_message.dart';
import 'package:my_communify/features/chat/providers/chat_provider.dart';
import 'package:my_communify/features/chat/widgets/chat_message_list.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key, required this.receiver});

  final User receiver;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  late final io.Socket socket;

  final _textController = TextEditingController();
  final _socketClient = di.get<SocketClient>();

  @override
  void initState() {
    super.initState();
    socket = _socketClient.connect(
      queryParams: {'userId': _getCurrentUserId()},
    );

    socket.onConnect(_onConnect);

    socket.onDisconnect((data) {});
  }

  @override
  void dispose() {
    super.dispose();
    socket.dispose();
  }

  String? _getCurrentUserId() {
    return ref.read(authProvider.select((s) => s.value?.user?.id));
  }

  void _sendMessage(String value) {
    final submitValue = value.trim();

    if (submitValue.isEmpty) return;

    final senderId = _getCurrentUserId();

    if (senderId == null) return;

    final message = ChatMessage(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      senderId: senderId,
      receiverId: widget.receiver.id,
      message: submitValue,
    );

    socket.emit('send_message', message.toMap());

    ref.read(chatProvider.notifier).addMessage(message);

    _textController.clear();
  }

  void _onConnect(dynamic data) {
    socket.on('receive_message', _onReceiveMessage);
  }

  void _onReceiveMessage(dynamic data) {
    final message = ChatMessage.fromMap(data);
    ref.read(chatProvider.notifier).addMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColor.watch(ref);

    return Unfocusable(
      child: CommonScreen(
        titleWidget: Row(
          mainAxisSize: .min,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.receiver.avatar ?? ''),
              maxRadius: 16,
            ),
            Gap(4),
            Text(widget.receiver.fullName ?? ''),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final messages = ref.watch(
                    chatProvider.select((s) => s.value!.messages),
                  );
                  return ChatMessageList(messages: messages);
                },
              ),
            ),
            CommonTextField(
              controller: _textController,
              placeholder: 'Enter message...',
              suffix: GestureDetector(
                onTap: () => _sendMessage(_textController.text),
                child: Icon(Icons.send, color: colors.primary),
              ),
              onSubmitted: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
