import 'package:flutter/material.dart';

import '../themes/colors.dart';

class MiniButton extends StatelessWidget {
  final IconData? icon;
  final void Function()? onPressed;
  const MiniButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 2.0,
              backgroundColor: lightPrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              padding: EdgeInsets.all(8.0)),
          child: Icon(icon, color: Colors.black, size: 16)),
    );
  }
}
