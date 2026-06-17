import 'package:my_communify/features/auth/models/user.dart';
import 'package:my_communify/features/conversations/models/conversation.dart';

final mockConversations = <Conversation>[
  Conversation(
    id: '1',
    participant: User(
      id: '1',
      email: 'meow2503@gmail.com',
      fullName: 'Meow meow',
      avatar:
          'https://images.pexels.com/photos/33585484/pexels-photo-33585484.jpeg',
    ),
  ),
  Conversation(
    id: '2',
    participant: User(
      id: '2',
      email: 'duynguyenxxx@gmail.com',
      fullName: 'Duy Nguyen',
      avatar:
          'https://images.pexels.com/photos/19511759/pexels-photo-19511759.jpeg',
    ),
  ),
  Conversation(
    id: '3',
    participant: User(
      id: '3',
      email: 'giahan@gmail.com',
      fullName: 'Gia Han',
      avatar:
          'https://images.pexels.com/photos/11238585/pexels-photo-11238585.jpeg',
    ),
  ),
];
