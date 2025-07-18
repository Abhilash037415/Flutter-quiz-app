import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quizlogo.png',
            width: 300,
            color: Color(0xFF4B2E2E),
          ),
          SizedBox(height: 60),
          Text(
            'Learning Flutter the fun way!',
            style: GoogleFonts.nunito(fontSize: 25, color: Color(0xFF4B2E2E)),
          ),
          SizedBox(height: 60),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 151, 76, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ), // removes all roundness
              ),
            ),
            icon: Icon(Icons.arrow_right_alt,color: Colors.white,),
            label: Text('Start quiz', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
