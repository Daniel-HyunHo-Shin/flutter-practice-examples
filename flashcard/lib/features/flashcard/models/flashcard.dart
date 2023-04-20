class Flashcard {
  final String id;
  final String question;
  final String answer;
  final String imageUrl;
  final String audioUrl;
  final int reviewInterval;
  final DateTime nextReviewDate;

  Flashcard({
    required this.id,
    required this.question,
    required this.answer,
    required this.imageUrl,
    required this.audioUrl,
    required this.reviewInterval,
    required this.nextReviewDate,
  });

  factory Flashcard.fromMap(Map<String, dynamic> data, String documentId) {
    return Flashcard(
      id: documentId,
      question: data['question'] ?? '',
      answer: data['answer'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      audioUrl: data['audioUrl'] ?? '',
      reviewInterval: data['reviewInterval'] ?? 1,
      nextReviewDate: data['nextReviewDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              data['nextReviewDate'].seconds * 1000)
          : DateTime.now(),
    );
  }
}
