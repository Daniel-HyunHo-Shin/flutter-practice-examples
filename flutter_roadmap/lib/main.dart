import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'pages/flutter_screen.dart';
import 'pages/progress_screen.dart';

final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const FlutterRoadMapScreen(),
  ),
  GoRoute(
    path: '/statistics',
    builder: (context, state) => const StatScreen(),
  ),
]);

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.grey),
      darkTheme: ThemeData.dark(useMaterial3: true),
      routerConfig: _router,
    );
  }
}
