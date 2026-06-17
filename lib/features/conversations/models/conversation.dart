import 'package:my_communify/features/auth/models/user.dart';

class Conversation {
  final String id;
  final User participant;

  Conversation({required this.id, required this.participant});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'participant': participant.toJson()};
  }

  factory Conversation.fromJson(Map<String, dynamic> map) {
    return Conversation(
      id: map['id'] as String,
      participant: User.fromJson(map['participant'] as Map<String, dynamic>),
    );
  }
}
