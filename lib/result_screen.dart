import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_project/data/questions.dart';
import 'package:quiz_project/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.selectedOptions,
    required this.restart,
  });

  final List<String> selectedOptions;
  final Function() restart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedOptions.length; i++) {
      summary.add({
        'questionindex': i,
        'question': questions[i].question,
        'answer': questions[i].options[0],
        'selected-answer': selectedOptions[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummary();
    final totalQuestions = summarydata.length;
    final correctQuestions = summarydata.where((data) {
      return data['answer'] == data['selected-answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctQuestions questions correct out of $totalQuestions questions',
              style: GoogleFonts.nunito(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionsSummary(getSummary()),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.all(20),
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 151, 76, 1),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                ),
                onPressed: restart,
                icon: Icon(Icons.refresh, color: Colors.white),
                label: Text(
                  'Restart Button',
                  style: GoogleFonts.nunito(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
