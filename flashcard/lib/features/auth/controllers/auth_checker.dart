import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../flashcard/views/flashcard_feed_page.dart';
import '../providers/auth_provider.dart';
import '../views/erroer_screen.dart';
import '../views/loader.dart';
import '../views/login_screen.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the authentication state using the authStateProvider
    final authState = ref.watch(authStateProvider);

    // Handle the different states of the AsyncValue
    return authState.when(
        data: (data) {
          // If user is authenticated, navigate to HomeScreen
          if (data != null) return const FlashcardFeedPage();
          // If user is not authenticated, navigate to LoginScreen
          return const LoginScreen();
        },
        // If state is loading, show a loading screen
        loading: () => const Loader(),
        // If there's an error, show an error screen with the error message and stack trace
        error: (e, trace) => ErrorScreen(e, trace));
  }
}
