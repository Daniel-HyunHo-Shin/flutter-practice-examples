import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.percent});

  final double percent;

  @override
  Widget build(BuildContext context) {
    Color color = percent >= 0 ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.all(2),
      width: 70,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Text(
        '${percent.toString()}%',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
