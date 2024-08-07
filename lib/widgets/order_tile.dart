import 'package:flutter/material.dart';
import 'package:pharmeasy/themes/colors.dart';
import 'package:pharmeasy/themes/fonts.dart';

import '../models/medicine.dart';

class OrderTile extends StatelessWidget {
  final Medicine order;
  final Function()? onTap;

  const OrderTile({super.key, required this.order, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [shadow],
                color: backgroundPrimary),
            margin: EdgeInsets.only(left: 5),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [shadow]),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            order.imagePath,
                            height: 140,
                          ))),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      width: 160,
                      child: Text(
                        order.name,
                        style: normalText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: lightPrimary),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'View Product',
                        style: normalText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
