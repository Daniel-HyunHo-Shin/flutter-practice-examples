import 'package:flutter/material.dart';

class NudeButton extends StatelessWidget {
  const NudeButton({Key? key, required this.ontap, required this.text})
      : super(key: key);

  final String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white70,
        foregroundColor: Colors.black,
      ),
      onPressed: ontap,
      child: Text(text),
    );
  }
}
