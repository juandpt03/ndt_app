class Question {
  final String question;
  final List<String> options;
  final int answer;
  final String image;

  Question({
    required this.image,
    required this.question,
    required this.options,
    required this.answer,
  });
}
