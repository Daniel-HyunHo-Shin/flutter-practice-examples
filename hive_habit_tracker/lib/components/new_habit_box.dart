import 'package:flutter/material.dart';

class EnterNewHabitBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const EnterNewHabitBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            onSave();
          },
          child: const Text('Save'),
        ),
        ElevatedButton(
          onPressed: () {
            onCancel();
          },
          child: const Text('cancel'),
        ),
      ],
    );
  }
}
