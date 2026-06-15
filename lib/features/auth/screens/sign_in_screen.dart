import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_communify/assets/assets.dart';
import 'package:my_communify/core/models/exception.dart';
import 'package:my_communify/core/widgets/button/button.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (prev, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          if (error is ApiException &&
              error.code != GoogleSignInExceptionCode.canceled.name) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog.adaptive(
                  title: Text('Error'),
                  content: Text(error.toString()),
                );
              },
            );
          }
        },
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to My communify!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 24),
            Button(
              onTap: () async {
                await ref.read(authProvider.notifier).signInWithGoogle();
              },
              title: 'Sign in with Google',
              prefix: SvgPicture.asset(Assets.icon.google),
            ),
          ],
        ),
      ),
    );
  }
}
