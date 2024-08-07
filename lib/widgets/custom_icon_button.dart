import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String imagePath;
  final Function()? onPressed;
  CustomIconButton(
      {super.key, required this.onPressed, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0))),
        child: Image.asset(
          imagePath,
          height: 20,
        ));
  }
}
