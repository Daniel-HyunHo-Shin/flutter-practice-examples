import 'package:flutter/material.dart';

import '../contollers/flashcard_controller.dart';
import '../models/flashcard.dart';
import 'flash_card_feed_Item.dart';

class TikTokFeed extends StatefulWidget {
  const TikTokFeed({super.key});

  @override
  _TikTokFeedState createState() => _TikTokFeedState();
}

class _TikTokFeedState extends State<TikTokFeed> {
  final PageController _pageController = PageController();
  final FlashcardController _flashcardController = FlashcardController();
  List<Flashcard> _flashcards = [];

  @override
  void initState() {
    super.initState();
    _fetchFlashcards();
  }

  Future<void> _fetchFlashcards() async {
    List<Flashcard> flashcards = await _flashcardController.getFlashcards();
    setState(() {
      _flashcards = flashcards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: _flashcards.length,
      itemBuilder: (context, index) {
        return FlashcardFeedItem(flashcard: _flashcards[index]);
      },
    );
  }
}
