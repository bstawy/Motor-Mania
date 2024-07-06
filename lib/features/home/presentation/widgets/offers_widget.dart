import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/colors_manager.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({super.key});

  Widget _buildOfferContainer({required String imagePath, Color? color}) {
    return Container(
      padding: EdgeInsets.only(right: 12.w, top: 12.h, bottom: 12.h),
      decoration: BoxDecoration(
        color: color ?? ColorsManager.red,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Image.asset(imagePath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        _buildOfferContainer(
          imagePath: "assets/images/offer_image.png",
        ),
        _buildOfferContainer(
          imagePath: "assets/images/offer_image.png",
          color: ColorsManager.black,
        ),
        _buildOfferContainer(
          imagePath: "assets/images/offer_image.png",
          color: ColorsManager.grey,
        ),
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
