// lib/screens/result_screen.dart
import 'package:choiraquizapp/provider/quizprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final pct = (quiz.score / quiz.total * 100).round();
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Your Score',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              '${quiz.score} / ${quiz.total}  ($pct%)',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: () {
                quiz.reset();
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}
