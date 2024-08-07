import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/fonts.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 48,
        width: 46,
        child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            textAlign: TextAlign.center,
            style: mediumText),
      ),
    );
  }
}
