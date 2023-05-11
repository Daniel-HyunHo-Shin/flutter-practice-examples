import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_tracker/screens/tabs.dart';
import 'package:recipe_tracker/theme/pallete.dart';

void main(List<String> args) {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TabScreen(),
      theme: Pallete.darkModeAppTheme,
    );
  }
}
