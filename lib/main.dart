import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmeasy/providers/sign_in.dart';
import 'package:pharmeasy/widgets/authenticator.dart';
import 'package:provider/provider.dart';
import 'models/shop.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
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
