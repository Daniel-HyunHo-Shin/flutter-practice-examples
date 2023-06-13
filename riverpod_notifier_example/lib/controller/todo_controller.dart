import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/model.dart';

final todosProvider = NotifierProvider<TodosNotifier, List<Todo>>(
  () {
    return TodosNotifier();
  },
);

class TodosNotifier extends Notifier<List<Todo>> {
  @override
  // build is a function that initialized the list
  List<Todo> build() {
    return [
      Todo(
        id: '1',
        description: 'Finish homework',
        completed: false,
      ),
      Todo(
        id: '2',
        description: 'Go grocery shopping',
        completed: false,
      ),
      Todo(
        id: '3',
        description: 'Walk the dog',
        completed: true,
      ),
    ];
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo
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
