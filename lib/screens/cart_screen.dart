import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmeasy/themes/fonts.dart';
import 'package:pharmeasy/widgets/cart_tile.dart';
import 'package:provider/provider.dart';

import '../models/medicine.dart';
import '../models/shop.dart';
import '../themes/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double delieveryFee = 15.00;
    double discounts = 12.00;

    return Consumer<Shop>(
        builder: (context, shop, child) => Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                          Spacer(),
                          Text('Cart', style: mediumText),
                          Spacer()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your Address', style: smallText),
                            SizedBox(height: 10.0),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: brightPrimary, size: 24),
                                Text('Elm Street, 23', style: smallText),
                                Spacer(),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                          color: brightPrimary, width: 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 8),
                                      child: Text('Change',
                                          style: GoogleFonts.poppins(
                                              color: brightPrimary,
                                              fontSize: 14)),
                                    ))
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 15.0),
                              child: Wrap(
                                children: [
                                  Text('Bangkok City, Bangkok 10900, Thailand',
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey))
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                            color: Colors.grey[600]!, width: 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Text(
                                          'Add Details',
                                          style: GoogleFonts.poppins(
                                            color: Colors.grey[600]!,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                            color: Colors.grey[600]!, width: 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Text(
                                          'Add Note',
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey[600]!,
                                              fontSize: 14),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Visibility(
                              visible: shop.cart.isEmpty,
                              replacement: Column(
                                children: [
                                  SizedBox(
                                      height: calculateHeight(
                                          shop.cart.length, context),
                                      child: ListView.builder(
                                        itemCount: shop.cart.length,
                                        itemBuilder: (context, index) {
                                          final List<Medicine> cartKeys =
                                              shop.cart.keys.toList();
                                          final Medicine medicine =
                                              cartKeys[index];
                                          final int quantityCount =
                                              shop.cart[medicine] ?? 0;
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: CartTile(
                                                medicine: medicine,
                                                quantityCount: quantityCount),
                                          );
                                        },
                                      )),
                                  _drawLine(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: lightPrimary,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Apply Coupon Code',
                                              style: normalText,
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 24,
                                              color: Colors.black,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  _drawLine(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Payment Method',
                                          style: normalText,
                                        ),
                                        Spacer(),
                                        Text('Cash on Demand',
                                            style: normalText)
                                      ],
                                    ),
                                  ),
                                  _drawLine(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 5.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Delivery Charges',
                                          style: normalText,
                                        ),
                                        Spacer(),
                                        Text('$delieveryFee THB',
                                            style: smallText)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Discounts',
                                          style: normalText,
                                        ),
                                        Spacer(),
                                        Text('$discounts THB', style: smallText)
                                      ],
                                    ),
                                  ),
                                  _drawLine(),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Total',
                                          style: mediumText,
                                        ),
                                        Spacer(),
                                        Text(
                                          '${shop.calculateTotalPrice() + delieveryFee + discounts} THB',
                                          style: mediumText,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: lightPrimary,
                                        boxShadow: [shadow],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: Text('PAY NOW',
                                                style: mediumText)),
                                      )),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.33,
                                      child: Image.asset(
                                          'assets/images/logos/empty-cart.png',
                                          fit: BoxFit.cover)),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text('No Item in Cart',
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey[400],
                                          fontSize: 18))
                                ]),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              ))),
            ));
  }

  Container _drawLine() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: DottedDecoration(
          shape: Shape.line, linePosition: LinePosition.bottom, strokeWidth: 2),
    );
  }
}

// Function to calculate dynamic height based on item count
double calculateHeight(int itemCount, BuildContext context) {
  const double itemHeight = 125;
  const double minHeight = 75;
  final double maxHeight =
      MediaQuery.of(context).size.height * 0.5; // Maximum height

  double calculatedHeight = itemCount * itemHeight;

  // Ensure the calculated height is within min and max height limits
  return calculatedHeight.clamp(minHeight, maxHeight);
}
