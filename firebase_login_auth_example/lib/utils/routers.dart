import 'package:firebase_login_auth_example/screens/email_login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/email_signup_page.dart';
import '../screens/home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'EmailSignUpPage',
          builder: (BuildContext context, GoRouterState state) {
            return const EmailSignUpPage();
          },
        ),
        GoRoute(
          path: 'EmailLogInPage',
          builder: (BuildContext context, GoRouterState state) {
            return const EmailLogInPage();
          },
        ),
      ],
    ),
  ],
);
