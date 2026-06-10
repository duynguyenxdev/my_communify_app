import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';
import 'package:my_communify/navigation/nav_path.dart';
import 'package:my_communify/navigation/routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.read(authProvider.notifier);

  return GoRouter(
    initialLocation: NavPath.splash,
    routes: routes,
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final authState = ref.read(authProvider).value ?? AuthState();

      if (authState.status == .initial) {
        return NavPath.splash;
      }

      final loggedIn = authState.isAuthenticated;
      final loggingIn = state.matchedLocation == NavPath.signIn;

      if (!loggedIn && !loggingIn) {
        return NavPath.signIn;
      }

      if (loggedIn && loggingIn) {
        return NavPath.dashboard;
      }

      return null;
    },
  );
});
