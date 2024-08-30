import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmeasy/screens/login_screen.dart';
import 'package:pharmeasy/themes/colors.dart';
import 'package:pharmeasy/themes/fonts.dart';
import 'package:pharmeasy/widgets/custom_button.dart';
import 'package:pharmeasy/widgets/custom_textfield.dart';
import 'package:pharmeasy/widgets/error_dialog.dart';
import 'package:pharmeasy/widgets/socials.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void registerUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (_passwordController.text == _confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
      } else {
        ErrorDialog.show(context, 'Passwords do not match');
      }
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      ErrorDialog.show(context, e.code);
    }
  }

  void googleReg() async {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                Text('Register', style: largeText),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: width * 0.75,
                  child: Text('Let\'s create an account for you!',
                      style: mediumText, textAlign: TextAlign.center),
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                          controller: _emailController,
                          obscureText: false,
                          hintText: 'Email'),
                      SizedBox(height: 20),
                      CustomTextField(
                          controller: _passwordController,
                          obscureText: true,
                          hintText: 'Password'),
                      SizedBox(height: 20),
                      CustomTextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          hintText: 'Confirm Password'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: CustomButton(
                          title: 'Register',
                          buttonColor: primary,
                          textColor: Colors.white,
                          onPressed: registerUser,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen())),
                  child: Text(
                    'Already have an account? Login',
                    style: smallText,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: height * 0.1),
                Text(
                  'or register with',
                ),
                Socials()
              ],
            )))));
  }
}
