import 'package:flutter/material.dart';
import 'package:pharmeasy/themes/colors.dart';

class ErrorDialog extends StatelessWidget {
  final String error;
  final Color backgroundColor;
  final TextStyle textStyle;

  const ErrorDialog(
      {super.key,
      required this.error,
      this.backgroundColor = const Color.fromRGBO(0, 4, 75, 1),
      this.textStyle = const TextStyle(color: Colors.white)});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Center(
        child: Text(error, style: textStyle),
      ),
    );
  }

  static void show(BuildContext context, String error,
      {Color? backgroundColor, TextStyle? textStyle}) {
    showDialog(
        context: context,
        builder: (context) {
          return ErrorDialog(
            error: error,
            backgroundColor: backgroundColor ?? primary,
            textStyle: textStyle ?? const TextStyle(color: Colors.white),
          );
        });
  }
}
