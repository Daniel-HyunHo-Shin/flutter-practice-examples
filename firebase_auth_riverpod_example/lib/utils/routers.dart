import 'package:firebase_auth_riverpod_example/features/authentication/pages/home_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
