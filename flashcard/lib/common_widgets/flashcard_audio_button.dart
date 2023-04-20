import 'package:flutter/material.dart';

class FlashcardAudioButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const FlashcardAudioButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.volume_up_rounded,
          size: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}
