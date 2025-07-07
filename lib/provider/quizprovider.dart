// lib/providers/quiz_provider.dart
import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizProvider with ChangeNotifier {
  final List<Question> _questions;
  int _index = 0;
  int _score = 0;
  bool? _lastCorrect;           // null = no answer yet

  QuizProvider(this._questions);

  Question get current => _questions[_index];
  int get currentIndex => _index + 1;
  int get total => _questions.length;
  int get score => _score;
  bool? get lastCorrect => _lastCorrect;

  void answer(int choiceIdx) {
    _lastCorrect = (choiceIdx == current.correct);
    if (_lastCorrect!) _score++;
    notifyListeners();
  }

  void next() {
    if (_index < _questions.length - 1) {
      _index++;
      _lastCorrect = null;
      notifyListeners();
    }
  }

  bool get finished => _index == _questions.length - 1 && _lastCorrect != null;

  Object? get selectedIndex => null;

  void reset() {
    _index = 0;
    _score = 0;
    _lastCorrect = null;
    notifyListeners();
  }
}
