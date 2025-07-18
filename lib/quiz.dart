import 'package:flutter/material.dart';
import 'package:quiz_project/data/questions.dart';
import 'package:quiz_project/questions_screen.dart';
import 'package:quiz_project/result_screen.dart';
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

  final List<String> selectedOptions = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseOption(String option) {
    selectedOptions.add(option);
    setState(() {
      if (selectedOptions.length == questions.length) {
        activeScreen = ResultScreen(
          selectedOptions: selectedOptions,
          restart: startAgain,
        );
      }
    });
  }

  void startAgain() {
    setState(() {
      selectedOptions.clear(); // 👈 resets previous answers
      activeScreen = StartScreen(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        chooseOption: chooseOption,
        restart: startAgain,
      );
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
              end: Alignment.bottomCenter,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
