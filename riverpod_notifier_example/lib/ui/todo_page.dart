import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/todo_controller.dart';
import '../models/model.dart';

class TodoPage extends HookConsumerWidget {
  const TodoPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todosProvider);
    return Scaffold(
      body: ListView(
        children: [
          for (final todo in todos)
            CheckboxListTile(
              value: todo.completed,
              onChanged: (value) =>
                  ref.watch(todosProvider.notifier).toggle(todo.id),
              title: Text(todo.description),
            ),
        ],
      ),
    );
  }
}
