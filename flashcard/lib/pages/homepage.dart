import 'package:flutter/material.dart';

import '../data/flash_card_feed_Item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  List<Flashcard> flashcards = [
    Flashcard(
      question: 'What is the capital of France?',
      answer: 'Paris',
      imageUrl: 'https://example.com/path/to/image1.jpg',
    ),
    Flashcard(
      question: 'What is the largest planet in our solar system?',
      answer: 'Jupiter',
      imageUrl: 'https://example.com/path/to/image2.jpg',
    ),
    // Add more flashcards as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: flashcards.length,
        itemBuilder: (context, index) {
          return FlashcardFeedItem(flashcard: flashcards[index]);
        },
      ),
    );
  }
}
