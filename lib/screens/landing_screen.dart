import 'package:flutter/material.dart';
import 'package:pharmeasy/screens/login_screen.dart';
import 'package:pharmeasy/themes/colors.dart';
import 'package:pharmeasy/themes/fonts.dart';
import 'package:pharmeasy/widgets/custom_button.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logos/pharmeasy-logo.png',
              height: height * 0.42,
            ),
            SizedBox(height: 12),
            Text(
              'PharmEasy',
              style: xtraLargeText,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: width * 0.65,
              child: Text(
                'Where Care Meets Convenience',
                style: mediumText,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 36,
            ),
            SizedBox(
              height: height * 0.075,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    title: 'Log In',
                    buttonColor: primary,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  CustomButton(
                      title: 'Register',
                      buttonColor: Colors.white,
                      textColor: Colors.black,
                      onPressed: () {})
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
