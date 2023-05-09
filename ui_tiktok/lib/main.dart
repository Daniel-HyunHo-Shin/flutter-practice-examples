import 'package:flutter/material.dart';

import 'lifed_State.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData().copyWith(brightness: Brightness.dark, useMaterial3: true),
      home: const HomePage(),
    );
  }
}
