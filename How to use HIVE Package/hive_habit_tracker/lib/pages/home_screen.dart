import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_habit_tracker/data/habit_database.dart';

import '../components/floating_action_button.dart';
import '../components/habit_tile.dart';
import '../components/my_alert_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// data structure for todays list
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  bool currentHabitState = false;

  @override
  void initState() {
    // If the app is the first time opening it or not
    // Then create the default box
    if (_myBox.get('Current_Habit_List') == null) {
      db.createDefaultData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  // checkbox is tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value!;
    });
  }

  // save new habit
  void saveNewHabit() {
    // add new habitto the today habit list
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });

    // clear textfield
    _newHabitNameController.clear();

    // pop dialog box
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
          return MyAlertBox(
            hintText: 'New Habit',
            controller: _newHabitNameController,
            onSave: saveNewHabit,
            onCancel: cancelNewHabit,
          );
        });
  }

  // open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
            hintText: 'New Name',
            controller: _newHabitNameController,
            onSave: () => saveExisitingHabit(index),
            onCancel: cancelNewHabit);
      },
    );
  }

  // save exisitng habit with a new name
  void saveExisitingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
  }

// delete selcted habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
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
        itemCount: db.todaysHabitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
            habitName: db.todaysHabitList[index][0],
            value: db.todaysHabitList[index][1],
            onChanged: (value) => checkBoxTapped(value, index),
            settingTapped: (context) => openHabitSettings(index),
            deleteTapped: (context) => deleteHabit(index),
          );
        },
      ),
    );
  }
}
