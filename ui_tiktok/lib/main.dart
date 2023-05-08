import 'package:flutter/material.dart';

import 'homepage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(brightness: Brightness.dark),
      home: const HomePage(),
    );
  }
}
