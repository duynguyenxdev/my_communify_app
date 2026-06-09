import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_communify/app.dart';
import 'package:my_communify/config/env.dart';
import 'package:my_communify/core/di/di.dart';
import 'package:my_communify/core/storage/secure_storage.dart';
import 'package:my_communify/core/storage/local_storage.dart';
import 'package:my_communify/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  final sharedPrefsService = di.get<LocalStorage>();
  final isFirstRun = await sharedPrefsService.getBool(
    LocalStorageKey.isFirstRun,
  );

  if (isFirstRun != true) {
    await Future.wait([
      di.get<SecureStorage>().clear(),
      sharedPrefsService.setBool(LocalStorageKey.isFirstRun, true),
    ]);
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GoogleSignIn.instance.initialize(clientId: Env.googleClientId);

  runApp(ProviderScope(child: const App()));
}
