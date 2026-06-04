import 'package:flutter/material.dart';
import 'package:my_communify/features/auth/models/user.dart';

class UserSearchItem extends StatelessWidget {
  const UserSearchItem({super.key, required this.user, required this.onTap});

  final User user;
  final void Function(User user) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(user),
      child: Ink(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(),
        child: Row(
          spacing: 8,
          children: [
            CircleAvatar(backgroundImage: NetworkImage(user.avatar ?? '')),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.email,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user.fullName ?? ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
