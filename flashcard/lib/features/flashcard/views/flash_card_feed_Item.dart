import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class FlashcardFeedItem extends StatefulWidget {
  final Flashcard
      flashcard; // The flashcard object containing the question, answer, and image/audio URLs
  final PageController
      pageController; // The page controller used for navigating between flashcards

  const FlashcardFeedItem({
    Key? key,
    required this.flashcard,
    required this.pageController,
  }) : super(key: key);

  @override
  _FlashcardFeedItemState createState() => _FlashcardFeedItemState();
}

class _FlashcardFeedItemState extends State<FlashcardFeedItem> {
  // Boolean to keep track of whether the card is flipped
  bool _isFlipped = false;

  void _goToNextPage() {
    // Function to navigate to the next flashcard using the page controller
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Toggle the flip state of the card when tapped
        setState(() {
          _isFlipped = !_isFlipped;
        });
      },
      child: Stack(
        children: [
          // The flashcard image as a background for the text
          SizedBox.expand(
            child: Image.network(
              widget.flashcard.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // A semi-transparent overlay to darken the image
          Container(color: Colors.black.withOpacity(0.3)),
          // The text of the question or answer in the center of the card
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _isFlipped
                    ? widget.flashcard
                        .answer // If the card is flipped, show the answer
                    : widget.flashcard.question, // If not, show the question
                style: const TextStyle(fontSize: 32, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // An audio player for the flashcard audio, with a toggle button

          if (_isFlipped)
            // If the card is flipped, show pass/fail buttons
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _isFlipped ? _goToNextPage : null,
                    child: const Text('Fail'),
                  ),
                  ElevatedButton(
                    onPressed: _isFlipped ? _goToNextPage : null,
                    child: const Text('Pass'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
