import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmeasy/themes/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  CustomTextField(
      {super.key, required this.controller, required this.obscureText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(245, 253, 253, 1.0),
            border: Border.all(color: primary, width: 2.0),
            borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
                border: InputBorder.none),
          ),
        ));
  }
}
