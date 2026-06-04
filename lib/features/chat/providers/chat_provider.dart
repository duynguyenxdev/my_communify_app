import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_communify/features/chat/models/chat_message.dart';

class ChatState {
  final List<ChatMessage> messages;

  ChatState({this.messages = const []});
}

class ChatNotifier extends AsyncNotifier<ChatState> {
  @override
  FutureOr<ChatState> build() {
    return ChatState();
  }

  void addMessage(ChatMessage newMessage) {
    state = AsyncValue.data(
      ChatState(messages: [...state.value!.messages, newMessage]),
    );
  }
}

final chatProvider = AsyncNotifierProvider(
  ChatNotifier.new,
  isAutoDispose: true,
);
