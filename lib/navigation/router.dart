import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';
import 'package:my_communify/navigation/nav_path.dart';
import 'package:my_communify/navigation/routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.read(authProvider.notifier);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: NavPath.signIn,
    routes: routes,
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final authState = ref.read(authProvider).value ?? AuthState();

      if (authState.status == .initial) {
        return NavPath.signIn;
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
