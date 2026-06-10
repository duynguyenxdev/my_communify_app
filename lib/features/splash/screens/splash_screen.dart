import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_communify/assets/assets.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';
import 'package:my_communify/core/widgets/image/svg_image.dart';
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
          context.replace(NavPath.signIn);
        }
      },
      error: (error, stackTrace) {
        context.go(NavPath.signIn);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColor.watch(ref);
    ref.listen(authProvider, _authListener);

    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: colors.primary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgImage(
                  Assets.icon.launcherForeground,
                  color: Colors.white,
                  height: 72,
                ),
                SizedBox(height: 8),
                Text(
                  'My Communify',
                  style: TextStyle(
                    fontWeight: .w600,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
