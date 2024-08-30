import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pharmeasy/themes/colors.dart';

final List<String> imgList = [
  'assets/images/banners/promo-banner.png',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(184, 242, 244, 1.0),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [shadow]),
          child: Image.asset(
            item,
          ),
        ))
    .toList();

class ManuallyControlledSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
          carouselController: _controller,
        ),
      ],
    );
  }
}
