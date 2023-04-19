import 'package:hive_flutter/hive_flutter.dart';

final _myBox = Hive.box("Habit_Database");

class HabitDatabase {
  List todaysHabitList = [];

  // create initial default data
  void createDefaultData() {
    List todaysHabitList = [
      ["Run", false],
      ["Read", false],
    ];
  }

  // load data if it already exists
  void loadData() {}

  // update database
  void updateDatabase() {}
}
