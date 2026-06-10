import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_communify/assets/app_icons.dart';
import 'package:my_communify/features/auth/providers/auth_provider.dart';
import 'package:my_communify/features/conversations/screens/conversations_screen.dart';
import 'package:my_communify/features/dashboard/widgets/bottom_bar.dart';
import 'package:my_communify/features/dashboard/widgets/bottom_bar_item.dart';
import 'package:my_communify/features/settings/screens/settings_screen.dart';
import 'package:my_communify/navigation/nav_path.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<BottomBarItem> _getBottomBarItems() {
    return [
      BottomBarItem(
        index: 0,
        selectedIndex: _currentIndex,
        label: 'Messages',
        iconPath: AppIcons.messages,
        onTap: _onTap,
      ),
      BottomBarItem(
        index: 1,
        selectedIndex: _currentIndex,
        label: 'Settings',
        iconPath: AppIcons.settings,
        onTap: _onTap,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider.select((s) => s.value?.user));

    return Scaffold(
      appBar: AppBar(
        title: Text('My workspace'),
        leading: Padding(
          padding: EdgeInsetsGeometry.all(12),
          child: GestureDetector(
            onTap: () {
              context.push(NavPath.profile);
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(user?.avatar ?? ''),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(NavPath.userSearch);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [ConversationsScreen(), SettingsScreen()],
      ),
      bottomNavigationBar: BottomBar(children: _getBottomBarItems()),
    );
  }
}
