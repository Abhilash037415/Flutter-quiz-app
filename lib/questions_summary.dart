import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: data['answer'] == data['selected-answer']
                        ? Color(0xFF4CAF50)
                        : Color(0xFFF44336),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ((data['questionindex'] as int) + 1).toString(),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          data['question'] as String,
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4B2E2E),
                          ),
                        ),
                      ),
                      Text(
                        data['answer'] as String,
                        style: GoogleFonts.nunito(
                          fontSize: 15,
                          color: Color(0xFF4CAF50),
                        ),
                      ),
                      Text(
                        data['selected-answer'] as String,
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: data['answer'] == data['selected-answer']
                              ? Color(0xFF103C1B)
                              : Color(0xFFC62828),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
