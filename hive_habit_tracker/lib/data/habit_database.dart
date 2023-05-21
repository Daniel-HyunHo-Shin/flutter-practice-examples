import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_habit_tracker/datetime/date_time.dart';

/// DataStructure 개요를 설명하겠습니다.
/// 데이터는 _myBox = Hibe.box("Habit_Database")에 저장되어 있습니다.
///
/// 저장된 데이터는 일반적으로 다음과 같은 양식으로 불러옵니다.
///
/// 특정 일자의 todaysHabitList
///   - _myBox.get(yyyymmdd) -> todaysHabitList
///
/// 지금 사용하는 todaysHAbit List
///   - _myBox.get("CURRENT_HABIT_LIST")
///
/// 우리가 이 앱을 사용하기 시작한 날짜
///   - _myBox.get("START_DATE") -> yyyymmdd

// referncing our box initialized at main
final _myBox = Hive.box("Habit_Database");

class HabitDataModel {
  List todaysHabitList = [];
  Map<DateTime, int> heatMapDataSet = {};

  // 1.todaysHabitList의 Default값을 설정합니다.
  // 2. 앱을 시작한 날짜를 기록합니다.
  void createDefaultData() {
    todaysHabitList = [
      ["Run", false],
      ["Read", false],
    ];

    // 기본값을 사용한다는 것은 앞서 이 자료를 이용한 적이 없다는 뜻입니다.
    // 즉, 이 앱을 처음 시작한다는 것을 뜻합니다
    // 이 앱은 습관을 추적하는 앱으로서, 앱 시작일자를 저장하고 있습니다.
    // 따라서 이 함수가 호출된 날짜를 시작일짜로 저장하고 있습니다.

    // Insight: 기본값을 호출할 때를 앱 시작일자로 사용 할 수 있다
    // Possible Problem: Reset기능을 추가한다면 Start Date가 초괴화 될 수 있음. CreateResetData()함수를 새로 선언하는 방법을 생각할 수 있음.
    _myBox.put("START_DATE", todaysDateFormatted());
  }

  // 오늘 일자에 저장된 todayshabitlist를 불러오는 함수입니다.
  void loadData() {
    // 오늘 날짜에 저장된 todaysHabitList가 없다면 가장 마지막에 저장된 todaysHabitList를 덮어씌웁니다.

    // 습관 추적기는 ToDo리스트와 다르게 전날의 습관을 오늘도 반복해야 합니다.
    // 날짜가 지나면 지난 날짜에 해당하는 키값에 저장된 값은 당연히 없을 것입니다.
    // 그 경우 전날 사용한 습관을 가져오는 것입니다.
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysHabitList = _myBox.get("CURRENT_HABIT_LIST");
      // 이와 동시에 todaysHabitList의 체크박스를 모두 해재한 값으로 불러옵니다.
      // 전날 저장된 todaysHabitList는 체크가 되어 있을 것이기 때문입니다/
      for (int i = 0; i < todaysHabitList.length; i++) {
        todaysHabitList[i][1] = false;
      }
    }
    // 새로운 날이 아니라면 todaysHabitList에 오늘 날짜에서 가져온 todaysHabitList를 덮어씌웁니다..
    else {
      todaysHabitList = _myBox.get(todaysDateFormatted());
    }
  }

  // todaysHabitList가 변경될 때마다 이를 Box에 반영합니다.
  // 1. 오늘 날짜에 현재 todaysHabitList를 추가합니다
  // 2. "Current_HABIT_LIST"를 키 값으로 현재 todaysHabitList를 추가합니다
  void updateDatabase() {
    // update todays entry
    _myBox.put(todaysDateFormatted(), todaysHabitList);

    // update universal habit list in case it chanage (new habit, edit habit, delete habit)
    _myBox.put("CURRENT_HABIT_LIST", todaysHabitList);

    calculateHabitPercentage();
    loadHeatMap();
  }

  void calculateHabitPercentage() {
    int counterCompleted = 0;
    for (var i = 0; i < todaysHabitList.length; i++) {
      if (todaysHabitList[i][1] == true) {
        counterCompleted++;
      }
    }
    String percent = todaysHabitList.isEmpty
        ? '0.0'
        : (counterCompleted / todaysHabitList.length).toStringAsFixed(1);

    _myBox.put("PERCENTAGE_SUMMARY_${todaysDateFormatted()}", percent);
  }

  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(_myBox.get("START_DATE"));

    int daysInBetween = DateTime.now().difference(startDate).inDays;

    // go from start date to today and add each percentage to the dataset
    // "PERCENTAGE_SUMMARY_yyyymmdd" will be the key in the database
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToString(
        startDate.add(Duration(days: i)),
      );

      double strengthAsPercent = double.parse(
        _myBox.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? "0.0",
      );

      // split the datetime up like below so it doesn't worry about hours/mins/secs etc.

      // year
      int year = startDate.add(Duration(days: i)).year;

      // month
      int month = startDate.add(Duration(days: i)).month;

      // day
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
      };

      heatMapDataSet.addEntries(percentForEachDay.entries);
      print(heatMapDataSet);
    }
  }
}
