import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  const MyButton(
      {Key? key,
      this.color,
      this.textColor,
      required this.buttonText,
      this.buttonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: GoogleFonts.montserrat(
                  color: textColor,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
