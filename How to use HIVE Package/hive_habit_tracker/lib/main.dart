import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home_screen.dart';

void main(List<String> args) async {
  // initialzie hive
  await Hive.initFlutter();
  runApp(const MainApp());

  // open a box
  await Hive.openBox("Habit_Database");
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
      ),
    );
  }
}
