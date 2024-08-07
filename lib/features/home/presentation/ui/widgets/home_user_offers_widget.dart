import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeUserOffersWidget extends StatelessWidget {
  const HomeUserOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset('assets/images/home_user_offers_image_1.png'),
        Image.asset('assets/images/home_user_offers_image_2.png'),
        Image.asset('assets/images/home_user_offers_image_3.png'),
      ],
      options: CarouselOptions(
        height: 138.h,
        viewportFraction: 0.8.r,
        enlargeCenterPage: true,
        enlargeFactor: 0.17.r,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
      ),
    );
  }
}
