import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pharmeasy/models/med_category.dart';
import 'package:pharmeasy/themes/colors.dart';
import 'package:pharmeasy/themes/fonts.dart';
import 'package:pharmeasy/widgets/carousel.dart';
import 'package:pharmeasy/widgets/cart_button.dart';
import 'package:pharmeasy/widgets/order_tile.dart';
import 'package:pharmeasy/widgets/searchbar.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';
import '../widgets/category_tile.dart';
import '../widgets/popular_tile.dart';
import '../widgets/rating_stars.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  int _selectedIndex = 0;

  List categoriesList = [
    MedCategory('Baby Care', Color.fromRGBO(215, 223, 255, 1.0),
        'assets/images/categories/baby-products.png'),
    MedCategory('Vitamins & Supplements', Color.fromRGBO(194, 233, 163, 1.0),
        'assets/images/categories/supplements.png'),
    MedCategory('Cough & Cold', Color.fromRGBO(163, 187, 233, 1.0),
        'assets/images/categories/cold-cough.png')
  ];

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final popularList = shop.medicineList;
    final orderHistoryList = shop.orderHistoryList;

    return Scaffold(
      backgroundColor: background,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  CustomSearchBar(),
                  SizedBox(
                    width: 10,
                  ),
                  CartButton()
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: ManuallyControlledSlider(),
                ),
                Text(
                  'Your Address',
                  style: mediumText,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: _displayAddress(),
                ),
                Text(
                  'Available Pharmacies',
                  style: mediumText,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: _displayPharmacy(),
                ),
                Text(
                  'Order Again',
                  style: mediumText,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    height: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: orderHistoryList.length,
                      itemBuilder: (context, index) => OrderTile(
                        order: orderHistoryList[index],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        medicine: orderHistoryList[index],
                                      )));
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('Medicines', style: mediumText),
                    Spacer(),
                    Text('View All', style: miniText)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: _displayCategories(),
                ),
                Row(
                  children: [
                    Text('Popular Medications', style: mediumText),
                    Spacer(),
                    Text('View All', style: miniText)
                  ],
                ),
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularList.length,
                    itemBuilder: (context, index) => PopularTile(
                      medicine: popularList[index],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      medicine: popularList[index],
                                    )));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: lightPrimary),
          child: GNav(
            rippleColor: Colors.white,
            hoverColor: Colors.white,
            haptic: true,
            tabBorderRadius: 16,
            curve: Curves.linear,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.white,
            tabMargin: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            textStyle:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.history,
                text: 'History',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorites',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  SizedBox _displayCategories() {
    return SizedBox(
      height: 125,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) => CategoryTile(
          category: categoriesList[index],
        ),
      ),
    );
  }

  Container _displayPharmacy() {
    return Container(
      decoration: BoxDecoration(
          color: backgroundPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [shadow]),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/images/pharmacies/pharmacy-store.png',
                      fit: BoxFit.cover,
                      height: 75,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jasmine\'s Drugs', style: smallText),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: brightPrimary, size: 24),
                            Text(
                              '2.5 km',
                              style: xtraSmallText,
                            ),
                          ],
                        ),
                      ),
                      Rating()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _displayAddress() {
    return Container(
      decoration: BoxDecoration(
          color: backgroundPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [shadow]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text(
                    'Edit',
                    style: miniText,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                    color: brightPrimary, size: 24),
                Text('Elm Street, 23', style: smallText),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Wrap(
                children: [
                  Text('Bangkok City, Bangkok 10900, Thailand',
                      style: normalText)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
