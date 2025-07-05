// lib/main.dart
import 'package:choiraquizapp/provider/quizprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/question.dart';

import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuizProvider(sampleQuestions),
        ),
      ],
      child: const QuizApp(),
    ),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choira Quiz',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/home': (_) => const HomeScreen(),
        '/quiz': (_) => const QuizScreen(),
        '/result': (_) => const ResultScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
