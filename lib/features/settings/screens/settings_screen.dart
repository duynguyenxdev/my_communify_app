import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/theme/theme_provider.dart';
import 'package:my_communify/core/widgets/layout/screen.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  void _onChangeThemeMode(bool isDarkMode) {}

  @override
  Widget build(BuildContext context) {
    final themeMode =
        ref.watch(themeProvider.select((s) => s.value?.themeMode)) ?? .light;

    return Screen(
      showAppBar: false,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Theme Mode (${themeMode.name})'),
              Switch.adaptive(
                value: themeMode == .light,
                onChanged: _onChangeThemeMode,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
