import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmeasy/themes/colors.dart';

import '../models/medicine.dart';

class CustomTabBar extends StatelessWidget {
  final Medicine medicine;
  const CustomTabBar({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            backgroundColor: lightPrimary,
            elevation: 5,
            borderWidth: 2,
            unselectedBackgroundColor: Colors.transparent,
            unselectedBorderColor: Colors.transparent,
            borderColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
            labelStyle: GoogleFonts.poppins(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                GoogleFonts.poppins(color: Colors.grey[350], fontSize: 18),
            tabs: [
              Tab(
                text: "Description",
              ),
              Tab(
                text: "Materials",
              ),
              Tab(text: 'Review')
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                Center(
                  child: Wrap(children: [
                    Text(medicine.longDescription,
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 14))
                  ]),
                ),
                Center(
                  child: Wrap(children: [
                    Text(medicine.longDescription,
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 14))
                  ]),
                ),
                Center(
                  child: Wrap(children: [
                    Text(medicine.longDescription,
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 14))
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
