import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';
import 'package:my_communify/navigation/nav_path.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(authProvider.notifier).authenticateLocalToken();
  }

  void _authListener(AsyncValue<AuthState>? prev, AsyncValue<AuthState> next) {
    next.whenOrNull(
      data: (state) {
        if (state.status == .authenticated) {
          context.go(NavPath.dashboard);
        } else {
          context.go(NavPath.signIn);
        }
      },
      error: (error, stackTrace) {
        context.go(NavPath.signIn);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, _authListener);

    return Scaffold(body: Center(child: Text('Splash Screen')));
  }
}
