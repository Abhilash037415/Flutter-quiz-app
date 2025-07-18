class QuizQuestions {
  const QuizQuestions(this.question, this.options);

  final String question;
  final List<String> options;

  List<String> getShuffledList() {
    final shuffled = List.of(options);
    shuffled.shuffle();
    return shuffled;
  }
}
