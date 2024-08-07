import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../themes/colors.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: 3.5,
      onValueChanged: (v) {
        //
      },
      starBuilder: (index, color) => Icon(
        Icons.star,
        color: color,
      ),
      starCount: 5,
      starSize: 20,
      valueLabelColor: lightPrimary,
      valueLabelTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 12.0),
      valueLabelRadius: 10,
      maxValue: 5,
      starSpacing: 2,
      maxValueVisibility: false,
      valueLabelVisibility: true,
      animationDuration: Duration(milliseconds: 1000),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      valueLabelMargin: const EdgeInsets.only(right: 8),
      starOffColor: const Color(0xffe7e8ea),
      starColor: Colors.yellow,
    );
  }
}
