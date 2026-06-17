import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/widgets/button/button.dart';
import 'package:my_communify/core/widgets/layout/screen.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider.select((state) => state.value?.user));

    return CommonScreen(
      title: 'Profile',
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user?.avatar ?? ''),
              radius: 48,
            ),
            SizedBox(height: 12),
            Text(
              '${user?.fullName}',
              style: TextStyle(fontWeight: .w600, fontSize: 20),
            ),
            SizedBox(height: 4),
            Text('${user?.email}', style: TextStyle(fontWeight: .w300)),
            Spacer(),
            CommonButton(
              title: 'Logout',
              fullWidth: true,
              onTap: () async {
                await ref.read(authProvider.notifier).signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
