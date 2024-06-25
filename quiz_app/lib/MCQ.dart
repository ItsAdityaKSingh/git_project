class MCQ {
  final int id;
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  MCQ({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}