class FlashCard {
  final int id;
  final String question;
  final String answer;
  final String? imageUrl;

  FlashCard({
    required this.imageUrl,
    required this.id,
    required this.question,
    required this.answer,
  });
}
