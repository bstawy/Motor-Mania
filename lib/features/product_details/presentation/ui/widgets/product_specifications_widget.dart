import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';

class ProductSpecificationsWidget extends StatelessWidget {
  const ProductSpecificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/free_delivery_icon.svg",
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(4.h),
                Text(
                  "Free Delivery",
                  textAlign: TextAlign.center,
                  style: TextStyles.font10DarkBlueMedium,
                ),
              ],
            ),
          ),
          Container(
            width: 1.w,
            height: 50,
            color: ColorsManager.lighterGrey,
          ).setHorizontalPadding(12.w),
          SizedBox(
            width: 60.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/high_rated_icon.svg",
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(4.h),
                Text(
                  "High Rated Seller",
                  textAlign: TextAlign.center,
                  style: TextStyles.font10DarkBlueMedium,
                ),
              ],
            ),
          ),
          Container(
            width: 1.w,
            height: 50,
            color: ColorsManager.lighterGrey,
          ).setHorizontalPadding(12.w),
          SizedBox(
            width: 60.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/low_return_icon.svg",
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(4.h),
                Text(
                  "Low Returns",
                  textAlign: TextAlign.center,
                  style: TextStyles.font10DarkBlueMedium,
                ),
              ],
            ),
          ),
          Container(
            width: 1.w,
            height: 50,
            color: ColorsManager.lighterGrey,
          ).setHorizontalPadding(12.w),
          SizedBox(
            width: 60.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/cash_on_delivery_icon.svg",
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(4.h),
                Text(
                  "Cash On Delivery",
                  textAlign: TextAlign.center,
                  style: TextStyles.font10DarkBlueMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
