// lib/screens/home_screen.dart
import 'package:choiraquizapp/provider/quizprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.read<QuizProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Choira Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/quiz-logo.png',
              height: 120,
            ),
            const SizedBox(height: 32),
            Text(
              'Ready to test your knowledge?',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            FilledButton.tonal(
              onPressed: () {
                quiz.reset();
                Navigator.pushNamed(context, '/quiz');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text('Start Quiz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
