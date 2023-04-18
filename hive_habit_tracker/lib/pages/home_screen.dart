import 'package:flutter/material.dart';

import '../components/habit_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: const [
          HabitTile(),
          HabitTile(),
          HabitTile(),
        ],
      ),
    );
  }
}
