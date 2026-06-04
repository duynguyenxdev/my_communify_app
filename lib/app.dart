import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/config/app_config.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';
import 'package:my_communify/navigation/router.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final isAuthenticated = ref.watch(
      authProvider.select((state) => state.value?.isAuthenticated ?? false),
    );

    final router = isAuthenticated
        ? authenticatedRouter
        : unauthenticatedRouter;

    return MaterialApp.router(
      title: AppConfig.title,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
