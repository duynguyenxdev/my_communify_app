import 'package:go_router/go_router.dart';
import 'package:my_communify/core/widgets/error/generic_error.dart';
import 'package:my_communify/features/auth/models/user.dart';
import 'package:my_communify/features/auth/screens/sign_in_screen.dart';
import 'package:my_communify/features/chat/screens/chat_screen.dart';
import 'package:my_communify/features/dashboard/screens/dashboard_screen.dart';
import 'package:my_communify/features/profile/screens/profile_screen.dart';
import 'package:my_communify/features/splash/screens/splash_screen.dart';
import 'package:my_communify/features/user_search/screens/user_search_screen.dart';
import 'package:my_communify/navigation/nav_path.dart';
import 'package:my_communify/utils/parsers.dart';

final routes = <GoRoute>[
  GoRoute(
    path: NavPath.splash,
    builder: (context, state) {
      return SplashScreen();
    },
  ),
  GoRoute(
    path: NavPath.signIn,
    pageBuilder: (context, state) {
      return NoTransitionPage(child: SignInScreen());
    },
  ),
  GoRoute(
    path: NavPath.profile,
    builder: (context, state) {
      return ProfileScreen();
    },
  ),
  GoRoute(
    path: NavPath.dashboard,
    builder: (context, state) {
      return DashboardScreen();
    },
  ),
  GoRoute(
    path: NavPath.userSearch,
    builder: (context, state) {
      return UserSearchScreen();
    },
  ),
  GoRoute(
    path: NavPath.chat,
    builder: (context, state) {
      final receiver = safeCast<User>(state.extra);
      if (receiver == null) {
        return GenericError();
      }
      return ChatScreen(receiver: receiver);
    },
  ),
];
