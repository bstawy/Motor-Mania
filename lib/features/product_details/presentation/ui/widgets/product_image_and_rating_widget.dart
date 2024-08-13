import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';

class ProductImageAndRatingWidget extends StatelessWidget {
  final String imageUrl;
  final num rating;
  final num reviewsCount;

  const ProductImageAndRatingWidget({
    super.key,
    required this.imageUrl,
    required this.rating,
    required this.reviewsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 210.h,
          width: double.infinity,
          child: Image.network(imageUrl),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 6.h,
              horizontal: 8.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: const Color(0xff171823),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/star_icon.svg",
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                Gap(4.w),
                Text(
                  "$rating ($reviewsCount)",
                  style: TextStyles.font10WhiteMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
