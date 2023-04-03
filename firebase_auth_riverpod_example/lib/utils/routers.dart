import 'package:firebase_auth_riverpod_example/features/authentication/models/auth_checker.dart';
import 'package:go_router/go_router.dart';

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
