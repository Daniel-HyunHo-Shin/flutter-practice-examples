import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home_screen.dart';

void main(List<String> args) async {
  // Flutter Framework 동작 전 Hive를 실행합니다.
  await Hive.initFlutter();
  // Hive Database 이름을 "Habit_Database"로 선언합니다.
  await Hive.openBox("Habit_Database");
  runApp(const MainApp());
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
        // Material Design3에서는 PrimarySwatch 사용방식이 ColorSchme parameter로 변경되었습니다.
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
      ),
    );
  }
}
