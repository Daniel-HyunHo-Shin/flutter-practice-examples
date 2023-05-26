import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifier_example/providers/provider.dart';
import 'package:riverpod_statenotifier_example/screens/add_screen.dart';

import '../models/todo_model.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todosProvider);

    return Scaffold(
      /// ----------------------------------
      ///
      /// AppBar
      ///
      /// ----------------------------------

      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),

      /// ----------------------------------
      ///
      /// Body
      ///
      /// ----------------------------------
      body: todos.isEmpty
          ? const Center(
              child: Text('추가된 리스트 없음'),
            )
          : ListView(
              children: [
                for (final todo in todos)
                  Dismissible(
                    key: ValueKey(todo.id),
                    onDismissed: (direction) {
                      ref.watch(todosProvider.notifier).removeTodo(todo.id);
                    },
                    child: CheckboxListTile(
                      value: todo.completed,
                      onChanged: (value) =>
                          ref.read(todosProvider.notifier).toggle(todo.id),
                      title: Text(todo.description),
                    ),
                  ),
              ],
            ),
    );
  }
}
