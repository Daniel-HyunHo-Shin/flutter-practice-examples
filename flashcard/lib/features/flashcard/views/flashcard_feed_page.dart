import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'flash_card_feed_item.dart';
import '../providers/flashcard_provider.dart';

class FlashcardFeedPage extends ConsumerWidget {
  const FlashcardFeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const userId = 'YOUR_USER_ID'; // Fetch your user ID here
    final flashcardsAsyncValue = ref.watch(flashcardProvider(userId));
    final pageController = PageController();

    return flashcardsAsyncValue.when(
      data: (flashcards) {
        return PageView.builder(
          controller: pageController,
          itemCount: flashcards.length,
          itemBuilder: (context, index) {
            return FlashcardFeedItem(
              flashcard: flashcards[index],
              pageController: pageController,
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          const Center(child: Text('An error occurred')),
    );
  }
}
