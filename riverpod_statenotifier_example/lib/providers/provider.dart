import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todo_model.dart';

///
/// State Object의 변경은 interface를 통해서만 이루어 집니다.

class TodosNotifier extends StateNotifier<List<Todo>> {
  // state 오브젝트는 super(___여기에___) 선언됩니다.
  // 아래 코드를 보면 super([])로 써져 있습니다.
  // 이 코드의 뜻은 TodoNotifier가 만드는 State의 초기 상태값이 빈 리스트 []라는 뜻입니다.
  TodosNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  // 이제 state를 변경하는
  void removeTodo(String todoId) {
    // removeTodo 함수가 실행시 새로운 state를 새로운 list에 바인딩 합니다.
    // 새로운 list는 for loop를 활용한 list comprehension으로 만들겠습니다.
    // 순차 접근 방식 알고리즘과 유사합니다.
    // Dart에서 List comprehension은 중괄호를 사용하지 않는 것에 유의하시길 바랍니다.
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}

/// 위 예시에서 저희는 다음을 수행했습니다.
/// 1.TodosNotifier가 전달할 값의 초기 상태값을 정의했습니다: super([])
/// 2.위 상태값이 변화할 3가지 interface를 정의하였습니다. 이외의 방식으로는 state는 변하지 않습니다.

/// 마지막으로 Provider 객체를 만들어 보도록 하겠습니다.
final todosProvider =
    StateNotifierProvider<TodosNotifier, List<Todo>>((ref) => TodosNotifier());

/// 해당 프로바이더 객체는 'TodosNotifier'의 instance를 반환합니다.
/// Dart의 강력한 Type추론 기능을 활용하기 위해 타입을 명시해 줍니다 '<TodosNotifier, List<Todo>>'
/// 