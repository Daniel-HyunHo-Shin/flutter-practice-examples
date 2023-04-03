import 'package:firebase_auth_riverpod_example/features/authentication/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/erroer_screen.dart';
import '../pages/loading_screen.dart';
import '../pages/login_screen.dart';
import '../providers/auth_providers.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (data) {
          if (data != null) return const HomeScreen();
          return const LoginScreen();
        },
        loading: () => const LoadingScreen(),
        error: (e, trace) => ErrorScreen(e, trace));
  }
}
