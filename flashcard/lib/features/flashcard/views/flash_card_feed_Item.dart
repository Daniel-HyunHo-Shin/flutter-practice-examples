import 'package:flutter/material.dart';
import '../../../common_widgets/flashcard_audio_player.dart';
import '../models/flashcard.dart';

class FlashcardFeedItem extends StatefulWidget {
  final Flashcard flashcard;
  final PageController pageController;

  const FlashcardFeedItem(
      {super.key, required this.flashcard, required this.pageController});

  @override
  _FlashcardFeedItemState createState() => _FlashcardFeedItemState();
}

class _FlashcardFeedItemState extends State<FlashcardFeedItem> {
  bool _isFlipped = false;

  void _goToNextPage() {
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onAudioToggle() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFlipped = !_isFlipped;
        });
      },
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
              widget.flashcard.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.3)),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _isFlipped
                    ? widget.flashcard.answer
                    : widget.flashcard.question,
                style: const TextStyle(fontSize: 32, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: FlashcardAudioPlayer(
              audioUrl: widget.flashcard.audioUrl,
              onToggle: _onAudioToggle,
            ),
          ),
          if (_isFlipped)
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
