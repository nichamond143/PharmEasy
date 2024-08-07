import 'package:flutter/material.dart';
import 'package:pharmeasy/screens/cart_screen.dart';

import '../themes/colors.dart';

class CartButton extends StatefulWidget {
  const CartButton({super.key});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
          style: ElevatedButton.styleFrom(
            elevation: 2.0,
            backgroundColor: lightPrimary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            padding: EdgeInsets.all(8.0),
          ),
          child: Icon(Icons.shopping_basket, color: Colors.black, size: 28)),
    );
  }
}
