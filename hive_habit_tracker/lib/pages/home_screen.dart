import 'package:flutter/material.dart';

import '../components/habit_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// data structure for todays list
  List todayHabitList = [
    ["Morning Run", false],
    ["Read Book", false],
  ];

  bool currentHabitState = false;

  // 체크박스 탭  상황
  void checkBoxTapped(bool? value) {
    setState(() {
      currentHabitState = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          HabitTile(
              habitName: "morning run",
              value: currentHabitState,
              onChanged: (value) => checkBoxTapped(value)),
        ],
      ),
    );
  }
}
