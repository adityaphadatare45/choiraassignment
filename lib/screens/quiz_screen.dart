// lib/screens/quiz_screen.dart
import 'package:choiraquizapp/provider/quizprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, child) {
        final q = quiz.current;
        return Scaffold(
          appBar: AppBar(
            title: Text('Question ${quiz.currentIndex}/${quiz.total}'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4),
              child: LinearProgressIndicator(
                value: quiz.currentIndex / quiz.total,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(q.text,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 24),
                ...List.generate(q.choices.length, (i) {
                  final isSelected = quiz.lastCorrect != null &&
                      i == q.correct;
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: quiz.lastCorrect == null
                        ? null
                        : isSelected
                            ? Colors.green.withOpacity(0.2)
                            : i ==
                                    (quiz.lastCorrect! ? q.correct : -1)
                                ? Colors.red.withOpacity(0.2)
                                : null,
                    child: ListTile(
                      title: Text(q.choices[i]),
                      onTap: quiz.lastCorrect == null
                          ? () {
                              quiz.answer(i);
                              Future.delayed(
                                const Duration(milliseconds: 600),
                                () {
                                  if (quiz.finished) {
                                    Navigator.pushReplacementNamed(
                                        context, '/result');
                                  } else {
                                    quiz.next();
                                  }
                                },
                              );
                            }
                          : null,
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
