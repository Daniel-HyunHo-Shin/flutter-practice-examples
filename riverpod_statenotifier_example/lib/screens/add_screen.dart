import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifier_example/provider.dart';
import 'package:riverpod_statenotifier_example/todo_model.dart';

class AddScreen extends ConsumerStatefulWidget {
  const AddScreen({super.key});

  @override
  ConsumerState<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends ConsumerState<AddScreen> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    @override
    void dispose() {
      textController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
            ),
            ElevatedButton(
              onPressed: () {
                final enteredText = textController.text.toString();
                final todo = Todo(null, enteredText, false);
                ref.read(todosProvider.notifier).addTodo(todo);
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
