import 'package:expense_tracker_app/features/authentication/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final router = GoRouter(
  initialLocation: LoginPage.routePath,
  routes: [
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
  ],
);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return router;
}
