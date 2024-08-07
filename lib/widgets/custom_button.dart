import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 4,
            backgroundColor: buttonColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0))),
        child: Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        ));
  }
}
