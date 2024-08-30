import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const ReturnButton({
    this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 10.0,
        left: 10.0,
        child: IconButton(
            onPressed: onPressed ?? () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.grey)));
  }
}
