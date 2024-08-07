import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeGuestOffersWidget extends StatefulWidget {
  const HomeGuestOffersWidget({super.key});

  @override
  State<HomeGuestOffersWidget> createState() => _HomeGuestOffersWidgetState();
}

class _HomeGuestOffersWidgetState extends State<HomeGuestOffersWidget> {
  late final CarouselControllerPlus _controller = CarouselControllerPlus();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          controller: _controller,
          items: [
            Image.asset('assets/images/guest_offers_image_1.png'),
            Image.asset('assets/images/guest_offers_image_2.png'),
            Image.asset('assets/images/guest_offers_image_3.png')
          ],
          options: CarouselOptions(
              height: 115.h,
              viewportFraction: 0.9.r,
              padEnds: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, reason) {
                selectedIndex = index;
                setState(() {});
              }),
        ),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Container(
                width: selectedIndex == i ? 16.w : 4.w,
                height: 4.w,
                margin: EdgeInsets.only(right: 5.w),
                decoration: BoxDecoration(
                  color: selectedIndex == i ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
          ],
        )
      ],
    );
  }
}
