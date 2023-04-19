import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// Flashcard class
class Flashcard {
  final String id;
  final String question;
  final String answer;
  final String imageUrl;

  Flashcard(
      {required this.question, required this.answer, required this.imageUrl})
      : id = const Uuid().v4();
}

class FlashcardFeedItem extends StatefulWidget {
  final Flashcard flashcard;

  const FlashcardFeedItem({super.key, required this.flashcard});

  @override
  _FlashcardFeedItemState createState() => _FlashcardFeedItemState();
}

class _FlashcardFeedItemState extends State<FlashcardFeedItem> {
  bool _showAnswer = false;

  void _toggleAnswer() {
    setState(() {
      _showAnswer = !_showAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleAnswer,
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
              widget.flashcard.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _showAnswer
                    ? widget.flashcard.answer
                    : widget.flashcard.question,
                style: const TextStyle(fontSize: 32, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
