import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmeasy/screens/verification_screen.dart';
import 'package:pharmeasy/themes/colors.dart';
import 'package:pharmeasy/themes/fonts.dart';
import 'package:pharmeasy/widgets/custom_button.dart';
import 'package:pharmeasy/widgets/custom_textfield.dart';

import '../widgets/custom_icon_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void wrongMessage(String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: primary,
          title: Center(
            child: Text(
              error,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login Here', style: largeText),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            width: width * 0.65,
            child: Text(
              'Welcome back you\'ve been missed!',
              style: mediumText,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                    controller: _emailController,
                    obscureText: false,
                    hintText: 'Email'),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    controller: _passwordController,
                    obscureText: true,
                    hintText: 'Password'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot your password?',
                          style: GoogleFonts.poppins(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CustomButton(
                      title: 'Log In',
                      buttonColor: primary,
                      textColor: Colors.white,
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            });
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim())
                              .then((_) {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VerificationScreen()),
                            );
                          });
                        } on FirebaseAuthException catch (e) {
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                          wrongMessage(e.code);
                        }
                      }),
                ),
              ],
            ),
          ),
          Text(
            'Create new account',
            style: smallText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Text(
            'Or continue with',
            style: smallText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
              height: 75,
              width: width * 0.75,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                        imagePath: 'assets/images/logos/logo-google.png',
                        onPressed: () {}),
                    CustomIconButton(
                        imagePath: 'assets/images/logos/logo-facebook.png',
                        onPressed: () {}),
                    CustomIconButton(
                        imagePath: 'assets/images/logos/apple-logo.png',
                        onPressed: () {}),
                  ]))
        ],
      )),
    );
  }
}
