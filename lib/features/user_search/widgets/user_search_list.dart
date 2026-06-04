import 'package:flutter/material.dart';
import 'package:my_communify/features/auth/models/user.dart';
import 'package:my_communify/features/user_search/widgets/user_search_item.dart';

class UserSearchList extends StatelessWidget {
  const UserSearchList({
    super.key,
    this.users = const [],
    required this.onTapItem,
  });

  final List<User> users;
  final void Function(User user) onTapItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: users.length, itemBuilder: _itemBuilder);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final user = users[index];
    return UserSearchItem(key: ValueKey(user.id), user: user, onTap: onTapItem);
  }
}
