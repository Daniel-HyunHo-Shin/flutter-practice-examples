class Flashcard {
  final String id;
  final String question;
  final String answer;
  final String imageUrl;

  Flashcard({
    required this.id,
    required this.question,
    required this.answer,
    required this.imageUrl,
  });

  factory Flashcard.fromMap(Map<String, dynamic> data, String documentId) {
    return Flashcard(
      id: documentId,
      question: data['question'] ?? '',
      answer: data['answer'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
