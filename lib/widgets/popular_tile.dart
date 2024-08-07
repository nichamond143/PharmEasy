import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/medicine.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';

class PopularTile extends StatelessWidget {
  final Medicine medicine;
  final Function()? onTap;
  final Function()? addToCart;
  const PopularTile(
      {super.key, required this.medicine, required this.onTap, this.addToCart});

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
                  Stack(alignment: AlignmentDirectional.topStart, children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [shadow]),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              medicine.imagePath,
                              height: 140,
                            ))),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color.fromRGBO(65, 65, 65, 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Text('4.5',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                ))
                          ],
                        ),
                      ),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      width: 160,
                      child: Text(
                        medicine.name,
                        style: normalText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(children: [
                    Text('${medicine.price.toString()} THB', style: smallText),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Add to cart');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lightPrimary),
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.add)),
                      ),
                    ),
                  ])
                ],
              ),
            )),
      ),
    );
  }
}
