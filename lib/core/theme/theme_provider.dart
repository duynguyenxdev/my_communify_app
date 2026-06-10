import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_communify/core/di/di.dart';
import 'package:my_communify/core/storage/local_storage.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';
import 'package:my_communify/core/theme/colors/light_color.dart';

class ThemeState {
  final ThemeMode themeMode;
  ThemeState({this.themeMode = .light});

  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  AppColor get colors => themeMode == .light ? LightColor() : LightColor();
}

class ThemeNotifier extends AsyncNotifier<ThemeState> {
  final _localStorage = di.get<LocalStorage>();

  @override
  FutureOr<ThemeState> build() async {
    final themeMode = await getThemeMode();
    return ThemeState(themeMode: themeMode);
  }

  Future<ThemeMode> getThemeMode() async {
    final themeModeName = await _localStorage.getString(.themeMode);
    final themeMode = ThemeMode.values.firstWhereOrNull(
      (e) => e.name == themeModeName,
    );
    return themeMode ?? .light;
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _localStorage.setString(.themeMode, themeMode.name);
    state = AsyncValue.data(state.requireValue.copyWith(themeMode: themeMode));
  }
}

final themeProvider = AsyncNotifierProvider(ThemeNotifier.new);
