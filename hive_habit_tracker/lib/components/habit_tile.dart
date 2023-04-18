import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.habitCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(28),
        child: Row(
          children: [
            Checkbox(
              value: habitCompleted,
              onChanged: onChanged,
            ),
            Text(habitName),
          ],
        ),
      ),
    );
  }
}
