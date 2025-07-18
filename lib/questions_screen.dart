import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_project/data/questions.dart';
import 'package:quiz_project/option.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentIndex = 0;
  void answerQuestion() {
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              style: GoogleFonts.lato(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B2E2E), // espresso brown
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ...question.getShuffledList().map(
              (item) => Option(option: item, onPress: answerQuestion),
            ),
          ],
        ),
      ),
    );
  }
}
