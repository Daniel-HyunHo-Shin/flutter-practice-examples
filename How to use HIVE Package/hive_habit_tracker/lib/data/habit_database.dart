import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_habit_tracker/datetime/date_time.dart';

// referncing our box initialized at main
final _myBox = Hive.box("Habit_Database");

class HabitDatabase {
  List todaysHabitList = [];

  // create initial default data
  // If CURRENT_HABIT_LIST has never been 'put', this one will be used.
  // It does two job. First
  void createDefaultData() {
    todaysHabitList = [
      ["Run", false],
      ["Read", false],
    ];

    // Then give start date information to the box. with keyword "START_DATE"
    _myBox.put("START_DATE", todaysDateFormatted());
  }

  // load data if it already exists
  void loadData() {
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysHabitList = _myBox.get("CURRENT_HABIT_LIST");
      for (int i = 0; i < todaysHabitList.length; i++) {
        todaysHabitList[i][1] = false;
      }
    }
    // If it's not a new day, load today's date
    else {
      todaysHabitList = _myBox.get(todaysDateFormatted());
    }
  }

  // update database
  void updateDatabase() {
    // update todays entry
    _myBox.put(todaysDateFormatted(), todaysHabitList);

    // update universal habit list in case it chanage (new habit, edit habit, delete habit)
    _myBox.put("CURRENT_HABIT_LIST", todaysHabitList);
    print('updated!');
  }
}
