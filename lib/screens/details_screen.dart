import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmeasy/screens/cart_screen.dart';
import 'package:pharmeasy/themes/colors.dart';
import 'package:pharmeasy/themes/fonts.dart';
import 'package:pharmeasy/widgets/custom_button.dart';
import 'package:pharmeasy/widgets/custom_tab_bar.dart';
import 'package:pharmeasy/widgets/mini_button.dart';
import 'package:provider/provider.dart';

import '../models/medicine.dart';
import '../models/shop.dart';
import '../widgets/cart_button.dart';

class DetailScreen extends StatefulWidget {
  final Medicine medicine;
  const DetailScreen({super.key, required this.medicine});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantityCount = 0;
  bool isFavorite = false;

  void decrementQuantity() {
    setState(() {
      quantityCount--;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.medicine, quantityCount);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                content: Text('Successfully added to cart!', style: smallText),
                contentPadding: EdgeInsets.all(25.0),
                backgroundColor: backgroundPrimary,
                alignment: Alignment.center,
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Ok',
                        textAlign: TextAlign.center,
                        style: smallText,
                      ))
                ],
              ));
    }
  }

  void buyNow() {
    if (quantityCount == 0) {
      quantityCount = 1;
    }

    final shop = context.read<Shop>();
    shop.addToCart(widget.medicine, quantityCount);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Spacer(),
                    CartButton()
                  ],
                ),
                SizedBox(height: 25.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [shadow],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(widget.medicine.imagePath,
                        height: MediaQuery.of(context).size.height * 0.4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.medicine.name,
                          style: mediumText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text('${widget.medicine.price.toString()} THB',
                        style: GoogleFonts.poppins(
                            color: secondary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Spacer(),
                    MiniButton(
                      icon: Icons.remove,
                      onPressed: decrementQuantity,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(quantityCount.toString(), style: mediumText),
                    ),
                    MiniButton(
                      icon: Icons.add,
                      onPressed: incrementQuantity,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: CustomTabBar(medicine: widget.medicine)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Colors.grey[350]!, width: 2),
                                color: Colors.transparent),
                            child: Center(
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                size: 36,
                                color: isFavorite ? Colors.red : Colors.grey,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomButton(
                            title: 'ADD TO CART',
                            buttonColor: backgroundPrimary,
                            textColor: Colors.black,
                            onPressed: () {
                              addToCart();
                            }),
                      ),
                      CustomButton(
                          title: 'BUY NOW',
                          buttonColor: lightPrimary,
                          textColor: Colors.black,
                          onPressed: () {
                            buyNow();
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
