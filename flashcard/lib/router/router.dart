import 'package:go_router/go_router.dart';

import '../features/auth/controllers/auth_checker.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AuthChecker(),
      ),
    ],
  );
}
