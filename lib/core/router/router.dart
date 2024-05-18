import 'package:expense_tracker_app/features/authentication/presentation/pages/auth_switcher.dart';
import 'package:expense_tracker_app/features/authentication/presentation/pages/login_page.dart';
import 'package:expense_tracker_app/features/authentication/presentation/pages/profile_page.dart';
import 'package:expense_tracker_app/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:expense_tracker_app/features/home/presentation/pages/home_page.dart';
import 'package:expense_tracker_app/main.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final router = GoRouter(
  navigatorKey: MyApp.navigatorKey,
  initialLocation: LoginPage.routePath,
  routes: [
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignupPage.routePath,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: AuthSwitcher.routePath,
      builder: (context, state) => const AuthSwitcher(),
    ),
    GoRoute(
      path: ProfilePage.routePath,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) => const HomePage(),
    ),
  ],
);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return router;
}
