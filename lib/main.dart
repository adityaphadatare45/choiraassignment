import 'package:choiraquizapp/provider/quizprovider.dart';
import 'package:choiraquizapp/routes.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF4A90E2), // Branded color
        scaffoldBackgroundColor: const Color(0xFFF6F9FF),
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Roboto', // Customize this if using Google Fonts
              bodyColor: Colors.black87,
              displayColor: Colors.black87,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (_) => const SplashScreen(),
        Routes.home: (_) => const HomeScreen(),
        Routes.quiz: (_) => const QuizScreen(),
        Routes.result: (_) => const ResultScreen(),
      },
    );
  }
}
