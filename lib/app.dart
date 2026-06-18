import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/config/app_config.dart';
import 'package:my_communify/core/managers/splash_screen_manager.dart';
import 'package:my_communify/core/theme/theme.dart';
import 'package:my_communify/core/theme/theme_provider.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';
import 'package:my_communify/navigation/router.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    ref.read(authProvider.notifier).authenticateLocalToken().then((_) {
      SplashScreenManager.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode =
        ref.watch(themeProvider.select((s) => s.value?.themeMode)) ?? .light;

    final router = ref.read(routerProvider);

    return MaterialApp.router(
      title: AppConfig.title,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      themeMode: themeMode,
      theme: themeData,
      darkTheme: themeData,
    );
  }
}
