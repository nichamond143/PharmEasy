import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmeasy/screens/register_screen.dart';
import 'package:pharmeasy/screens/verification_screen.dart';
import 'package:pharmeasy/themes/colors.dart';
import 'package:pharmeasy/themes/fonts.dart';
import 'package:pharmeasy/widgets/custom_button.dart';
import 'package:pharmeasy/widgets/custom_textfield.dart';
import 'package:pharmeasy/widgets/error_dialog.dart';
import 'package:pharmeasy/widgets/socials.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void loginUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim())
          .then((_) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const VerificationScreen()),
        );
      });
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      ErrorDialog.show(context, e.code);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
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
                          onPressed: loginUser),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                },
                child: Text(
                  'Create new account',
                  style: smallText,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Text(
                'Or continue with',
                style: smallText,
                textAlign: TextAlign.center,
              ),
              Socials()
            ],
          ),
        )),
      ),
    );
  }
}
