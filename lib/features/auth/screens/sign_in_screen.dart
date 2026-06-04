import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/widgets/button/app_solid_button.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: AppSolidButton(
          onTap: () async {
            await ref.read(authProvider.notifier).signInWithGoogle();
          },
          title: 'Sign in with Google',
        ),
      ),
    );
  }
}
