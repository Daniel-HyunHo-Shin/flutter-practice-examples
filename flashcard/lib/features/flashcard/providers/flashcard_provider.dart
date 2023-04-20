import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/flashcard.dart';

final flashcardProvider =
    StreamProvider.autoDispose.family<List<Flashcard>, String>((ref, userId) {
  final firestore = FirebaseFirestore.instance;

  // Fetch flashcards for a specific user and sort by nextReviewDate
  return firestore
      .collection('users')
      .doc(userId)
      .collection('flashcards')
      .orderBy('nextReviewDate')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Flashcard.fromMap(doc.data(), doc.id))
          .toList());
});
