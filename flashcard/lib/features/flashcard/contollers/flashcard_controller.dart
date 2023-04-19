import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/flashcard.dart';

class FlashcardController {
  final CollectionReference _flashcardsCollection =
      FirebaseFirestore.instance.collection('flashcards');

  Future<List<Flashcard>> getFlashcards() async {
    List<Flashcard> flashcards = [];

    try {
      QuerySnapshot snapshot = await _flashcardsCollection.get();
      flashcards = snapshot.docs.map((doc) {
        return Flashcard.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print('Error fetching flashcards: $e');
    }

    return flashcards;
  }
}
