// lib/models/question.dart
class Question {
  final String text;
  final List<String> choices;
  final int correct;               // index of correct answer

  const Question({
    required this.text,
    required this.choices,
    required this.correct,
  });
}
const sampleQuestions = <Question>[
  Question(
    text: 'Choira MusicTech was founded in which year?',
    choices: ['2017', '2019', '2021', '2023'],
    correct: 2,
  ),
  Question(
    text: 'Which widget is immutable in Flutter?',
    choices: ['StatefulWidget', 'StatelessWidget'],
    correct: 1,
  ),
  // add more…
];
