import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/views/sign_in_page.dart';
import '../features/flashcard/views/flashcard_feed_page.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      builder: (context, state) => const SignInPage(),
      path: '/',
    ),
    GoRoute(
      path: '/flashcard-feed',
      builder: (context, state) => const FlashcardFeedPage(),
    ),
  ],
);
