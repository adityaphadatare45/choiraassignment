import 'package:choiraquizapp/provider/quizprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, child) {
        final q = quiz.current;

        final isAnswered = selectedIndex != null;
        final isWrong = isAnswered && selectedIndex != q.correct;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Question ${quiz.currentIndex} of ${quiz.total}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(6),
              child: LinearProgressIndicator(
                value: quiz.currentIndex / quiz.total,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF4A90E2),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question text
                Text(
                  q.text,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                ),
                const SizedBox(height: 24),

                // Answer choices
                ...List.generate(q.choices.length, (i) {
                  final isCorrect = i == q.correct;
                  final isSelected = selectedIndex == i;

                  Color? tileColor;
                  if (isAnswered) {
                    if (isSelected && isCorrect) {
                      tileColor = Colors.green.withOpacity(0.2);
                    } else if (isSelected && !isCorrect) {
                      tileColor = Colors.red.withOpacity(0.2);
                    } else if (isCorrect) {
                      tileColor = Colors.green.withOpacity(0.1);
                    }
                  }

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: tileColor,
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        q.choices[i],
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: isAnswered
                          ? null
                          : () {
                              setState(() {
                                selectedIndex = i;
                              });
                              quiz.answer(i);

                              // Auto-next if correct
                              if (i == q.correct) {
                                Future.delayed(const Duration(milliseconds: 600), () {
                                  if (quiz.finished) {
                                    Navigator.pushReplacementNamed(context, '/result');
                                  } else {
                                    quiz.next();
                                    setState(() {
                                      selectedIndex = null;
                                    });
                                  }
                                });
                              }
                            },
                    ),
                  );
                }),

                const SizedBox(height: 32),

                // Only show "Next" button if answer is wrong
                if (isWrong)
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (quiz.finished) {
                          Navigator.pushReplacementNamed(context, '/result');
                        } else {
                          quiz.next();
                          setState(() {
                            selectedIndex = null;
                          });
                        }
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Next'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                        backgroundColor: const Color(0xFF4A90E2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
