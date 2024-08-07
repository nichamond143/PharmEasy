import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmeasy/widgets/authenticator.dart';
import 'package:provider/provider.dart';
import 'models/shop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD1p3PWG70kJ8oCAQnZKxlHBJc_QQT6Hps",
          authDomain: "pharmeasy-481a4.firebaseapp.com",
          projectId: "pharmeasy-481a4",
          storageBucket: "pharmeasy-481a4.appspot.com",
          messagingSenderId: "937758458478",
          appId: "1:937758458478:web:930e40ea1ebf125944dc7f"));
  runApp(ChangeNotifierProvider(
      create: (context) => Shop(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PharmEasy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            primary: Color.fromRGBO(155, 225, 215, 1),
            secondary: Color.fromRGBO(0, 4, 75, 1)),
        useMaterial3: true,
      ),
      home: const Authenticator(),
    );
  }
}
