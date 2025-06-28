import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../main.dart';

class ProductSpecificationsWidget extends StatelessWidget {
  const ProductSpecificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: customColors.inversePrimary,
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
                  themeIsDark
                      ? AssetsManager.freeDeliveryDarkIcon
                      : AssetsManager.freeDeliveryIcon,
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(4.h),
                Text(
                  "Free Delivery",
                  textAlign: TextAlign.center,
                  style: customTextStyles.labelLarge?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1.w,
            height: 50,
            color: ColorsManager.blueGrey,
          ).setHorizontalPadding(12.w),
          SizedBox(
            width: 60.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  themeIsDark
                      ? AssetsManager.highRatedDarkIcon
                      : AssetsManager.highRatedIcon,
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(4.h),
                Text(
                  "High Rated Seller",
                  textAlign: TextAlign.center,
                  style: customTextStyles.labelLarge?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1.w,
            height: 50,
            color: ColorsManager.blueGrey,
          ).setHorizontalPadding(12.w),
          SizedBox(
            width: 60.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  themeIsDark
                      ? AssetsManager.lowReturnDarkIcon
                      : AssetsManager.lowReturnIcon,
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(4.h),
                Text(
                  "Low Returns",
                  textAlign: TextAlign.center,
                  style: customTextStyles.labelLarge?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1.w,
            height: 50,
            color: ColorsManager.blueGrey,
          ).setHorizontalPadding(12.w),
          SizedBox(
            width: 60.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  themeIsDark
                      ? AssetsManager.cashOnDeliveryDarkIcon
                      : AssetsManager.cashOnDeliveryIcon,
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(4.h),
                Text(
                  "Cash On Delivery",
                  textAlign: TextAlign.center,
                  style: customTextStyles.labelLarge?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
