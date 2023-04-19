import 'package:uuid/uuid.dart';

class Flashcard {
  final String id;
  final String question;
  final String answer;
  final String imageUrl;

  Flashcard(
      {required this.question, required this.answer, required this.imageUrl})
      : id = const Uuid().v4();
}
