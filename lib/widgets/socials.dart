import 'package:flutter/widgets.dart';
import 'package:pharmeasy/providers/sign_in.dart';
import 'package:pharmeasy/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';

class Socials extends StatefulWidget {
  const Socials({super.key});

  @override
  State<Socials> createState() => _SocialsState();
}

class _SocialsState extends State<Socials> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignInProvider>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: 75,
        width: width * 0.75,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomIconButton(
              imagePath: 'assets/images/logos/logo-google.png',
              onPressed: () => provider.googleLogin()),
          CustomIconButton(
              imagePath: 'assets/images/logos/logo-facebook.png',
              onPressed: () => Navigator.pop(context)),
          CustomIconButton(
              imagePath: 'assets/images/logos/apple-logo.png',
              onPressed: () {}),
        ]));
  }
}
