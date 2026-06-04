import 'package:go_router/go_router.dart';
import 'package:my_communify/navigation/nav_path.dart';
import 'package:my_communify/navigation/routes.dart';

final unauthenticatedRouter = GoRouter(
  initialLocation: NavPath.splash,
  routes: unauthenticatedRoutes,
);

final authenticatedRouter = GoRouter(
  initialLocation: NavPath.dashboard,
  routes: authenticatedRoutes,
);
