import 'package:flutter/material.dart';
import 'package:reddit_clone/theme/pallette.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Reddit App Tutorial",
      debugShowCheckedModeBanner: false,
      theme: Pallete.lightModeAppTheme,
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
