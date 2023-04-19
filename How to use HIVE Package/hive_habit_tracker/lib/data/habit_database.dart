import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_habit_tracker/datetime/date_time.dart';

/// DataStructure 개요를 설명하겠습니다.
/// 데이터는 _myBox = Hibe.box("Habit_Database")에 저장되어 있습니다.
///
/// 저장된 데이터는 일반적으로 다음과 같은 양식으로 불러옵니다.
/// _myBox.get(yyyymmdd) -> todaysHabitList (습관 목록을 불러옵니다)
/// _myBox.get("START_DATE") -> yyyymmdd (우리가 이 앱을 사용하기 시작한 날짜입니다.)
/// _myBox.get("CURRENT_HABIT_LIST") -> 가장 마지막에 todaysHabitList를 불러옵니다

// referncing our box initialized at main
final _myBox = Hive.box("Habit_Database");

class HabitDataModel {
  List todaysHabitList = [];

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
    // Insight: 기본값을 호출할 때를 앱 시작일자로 사용 할 수 있다
    // Possible Problem: Reset기능을 추가한다면 Start Date가 초괴화 될 수 있음. CreateResetData()함수를 새로 선언하는 방법을 생각할 수 있음.
    _myBox.put("START_DATE", todaysDateFormatted());
  }

  // 오늘 일자에 저장된 todayshabitlist를 불러오는 함수입니다.
  void loadData() {
    // 오늘 날짜에 저장된 todaysHabitList가 없다면 가장 마지막에 저장된 todaysHabitList를 덮어씌웁니다.
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysHabitList = _myBox.get("CURRENT_HABIT_LIST");
      // 이와 동시에 todaysHabitList의 체크박스를 모두 해재한 값으로 불러옵니다.
      // loadData 함수는
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
