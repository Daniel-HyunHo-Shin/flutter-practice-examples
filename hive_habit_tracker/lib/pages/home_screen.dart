import 'package:flutter/material.dart';

import '../components/floating_action_button.dart';
import '../components/habit_tile.dart';
import '../components/new_habit_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// data structure for todays list
  List todayHabitList = [
    // [habit name, currentHabitState]
    ["Morning Run", false],
    ["Read Book", false],
  ];

  bool currentHabitState = false;

  // checkbox is tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todayHabitList[index][1] = value!;
    });
  }

  // save new habit
  void saveNewHabit() {
    todayHabitList.add([_newHabitNameController.text, false]);
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  // cancel new habit
  void cancelNewHabit() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  // create a new habit
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    // show a alert dialog for user to enter the new habit details
    showDialog(
        context: context,
        builder: (context) {
          return EnterNewHabitBox(
            controller: _newHabitNameController,
            onSave: saveNewHabit,
            onCancel: cancelNewHabit,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(
        onPressed: () {
          createNewHabit();
        },
      ),
      body: ListView.builder(
        itemCount: todayHabitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
            habitName: todayHabitList[index][0],
            value: todayHabitList[index][1],
            onChanged: (value) => checkBoxTapped(value, index),
          );
        },
      ),
    );
  }
}
