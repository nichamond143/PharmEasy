import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmeasy/screens/home_screen.dart';
import 'package:pharmeasy/themes/colors.dart';
import 'package:pharmeasy/widgets/custom_button.dart';
import 'package:pharmeasy/widgets/opt_textfield.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset('assets/images/logos/pin.png')),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
                  child: Text('OTP Verification',
                      style: GoogleFonts.poppins(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Enter the OTP sent to ',
                              style: GoogleFonts.poppins(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          Text('+66 1234567890',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Form(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OTPTextField(),
                    OTPTextField(),
                    OTPTextField(),
                    OTPTextField(),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Didn\'t receive the OTP?',
                              style: GoogleFonts.poppins(
                                color: Colors.grey[400],
                                fontSize: 14,
                              )),
                          TextButton(
                            onPressed: () {},
                            child: Text('Resend OTP',
                                style: GoogleFonts.poppins(
                                  color: primary,
                                  fontSize: 14,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: CustomButton(
                      title: 'Verify',
                      buttonColor: primary,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
