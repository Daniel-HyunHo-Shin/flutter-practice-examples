import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const MyAlertBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
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
