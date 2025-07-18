import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Option extends StatelessWidget {
  const Option({required this.option,required this.onPress,super.key});
  final String option;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 151, 76, 1),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPress,
      child: Text(
        option,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          textStyle: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
