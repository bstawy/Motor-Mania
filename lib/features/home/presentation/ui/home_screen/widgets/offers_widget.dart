import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset('assets/images/offer_image_2.png'),
        Image.asset('assets/images/offer_image_2.png'),
        Image.asset('assets/images/offer_image_2.png')
      ],
      options: CarouselOptions(
        height: 115.h,
        viewportFraction: 0.9.r,
        padEnds: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
      ),
    );
  }
}
