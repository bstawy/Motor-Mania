import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class GuestOffersLoadedWidget extends StatefulWidget {
  final List<String> offersUrl;

  const GuestOffersLoadedWidget({
    super.key,
    required this.offersUrl,
  });

  @override
  State<GuestOffersLoadedWidget> createState() =>
      _GuestOffersLoadedWidgetState();
}

class _GuestOffersLoadedWidgetState extends State<GuestOffersLoadedWidget> {
  late final CarouselControllerPlus _controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = CarouselControllerPlus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          controller: _controller,
          items: (widget.offersUrl).map((url) => Image.network(url)).toList(),
          options: CarouselOptions(
            height: 115.h,
            viewportFraction: 1.r,
            padEnds: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) {
              selectedIndex = index;
              setState(() {});
            },
          ),
        ),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.offersUrl.length; i++)
              Container(
                width: selectedIndex == i ? 16.w : 4.w,
                height: 4.h,
                margin: EdgeInsets.only(right: 5.w),
                decoration: BoxDecoration(
                  color: selectedIndex == i ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
