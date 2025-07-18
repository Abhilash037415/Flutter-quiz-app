import 'package:flutter/material.dart';
import 'package:quiz_project/questions_screen.dart';
import 'package:quiz_project/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFEECE2), // soft latte
                Color.fromARGB(255, 246, 169, 125), // caramel peach
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
