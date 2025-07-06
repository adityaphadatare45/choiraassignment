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
    text: 'Which widget is immutable in Flutter?',
    choices: ['StatefulWidget', 'StatelessWidget'],
    correct: 1,
  ),
  Question(
    text: 'Which language is primarily used to write Flutter apps?',
    choices: ['Kotlin', 'Dart', 'Swift', 'Java'],
    correct: 1,
  ),
  Question(
    text: 'What does the "hot reload" feature do?',
    choices: [
      'Restarts the app',
      'Refreshes code changes instantly',
      'Clears app cache',
      'Compiles native code'
    ],
    correct: 1,
  ),
  Question(
    text: 'Which widget is used to layout children vertically?',
    choices: ['Row', 'Stack', 'ListView', 'Column'],
    correct: 3,
  ),
  Question(
    text: 'What is the root widget of every Flutter app?',
    choices: ['MaterialApp', 'Scaffold', 'Container', 'Text'],
    correct: 0,
  ),
  Question(
    text: 'Which of the following is a state management solution in Flutter?',
    choices: ['Provider', 'Bloc', 'Riverpod', 'All of the above'],
    correct: 3,
  ),
  Question(
    text: 'What is the purpose of the `build()` method in a widget?',
    choices: [
      'To initialize variables',
      'To create UI every time state changes',
      'To handle routing',
      'To manage app lifecycle'
    ],
    correct: 1,
  ),
  Question(
    text: 'Which widget helps in scrolling a long list of items?',
    choices: ['ListView', 'Column', 'Row', 'Expanded'],
    correct: 0,
  ),
  Question(
    text: 'Which Flutter widget is used for user interaction like tapping?',
    choices: ['GestureDetector', 'Scaffold', 'SafeArea', 'AppBar'],
    correct: 0,
  ),
    Question(
    text: 'What does the `setState()` function do in Flutter?',
    choices: [
      'Sets the initial state of a widget',
      'Rebuilds the widget with new data',
      'Deletes the widget from memory',
      'Saves widget state to disk'
    ],
    correct: 1,
  ),
  Question(
    text: 'Which widget provides visual structure like AppBar and body?',
    choices: ['Container', 'Column', 'Scaffold', 'MaterialApp'],
    correct: 2,
  ),
  Question(
    text: 'Which widget allows flexible space distribution among children?',
    choices: ['Expanded', 'SizedBox', 'Align', 'Opacity'],
    correct: 0,
  ),
  Question(
    text: 'What does the `pubspec.yaml` file contain?',
    choices: [
      'UI layout',
      'Dart syntax rules',
      'App metadata and dependencies',
      'Build errors and logs'
    ],
    correct: 2,
  ),
  Question(
    text: 'Which tool is used to manage Flutter packages?',
    choices: ['DartPad', 'Xcode', 'Flutter Doctor', 'pub'],
    correct: 3,
  ),
];
