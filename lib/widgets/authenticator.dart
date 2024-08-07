import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmeasy/screens/home_screen.dart';
import 'package:pharmeasy/screens/landing_screen.dart';

class Authenticator extends StatelessWidget {
  const Authenticator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LandingScreen();
        }
      },
    ));
  }
}
