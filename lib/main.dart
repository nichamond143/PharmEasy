import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmeasy/providers/sign_in.dart';
import 'package:pharmeasy/widgets/authenticator.dart';
import 'package:provider/provider.dart';
import 'models/shop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDRmq6yx6i03J6n8Bfr0B8Biwvp6dtyXac",
          authDomain: "pharmeasy-da37c.firebaseapp.com",
          projectId: "pharmeasy-da37c",
          storageBucket: "pharmeasy-da37c.appspot.com",
          messagingSenderId: "918728843554",
          appId: "1:918728843554:android:b5af653efae1878a24857b"));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Shop()),
      ChangeNotifierProvider(create: (_) => SignInProvider()),
    ], child: const MyApp()));
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
