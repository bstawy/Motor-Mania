import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/helpers/extensions/extensions.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 51.h,
      ),
      color: ColorsManager.darkkBlue,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icons/location_icon.svg"),
                  Gap(6.w),
                  Text(
                    "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                    style: TextStyles.font12LightGreyMedium,
                  ),
                ],
              ),
              Gap(16.h),
              Text(
                "BMW i8 2017",
                style: TextStyles.font20WhiteBold,
              ),
              Gap(6.h),
              Text(
                "Your next maintenance\nwill be at 80,000 KM.",
                style: TextStyles.font10WhiteMedium,
              ),
              Gap(24.h),
              Text(
                "Your last purchases",
                style: TextStyles.font10LightGreySemiBold,
              ),
              Gap(8.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/checkmark_icon.svg"),
                  Gap(6.w),
                  Text(
                    "ACDelco 480",
                    style: TextStyles.font12LightGreyMedium,
                  ),
                ],
              ),
              Gap(6.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/checkmark_icon.svg"),
                  Gap(6.w),
                  Text(
                    "Bridgestone Tyre",
                    style: TextStyles.font12LightGreyMedium,
                  ),
                ],
              ),
            ],
          ).setHorizontalPadding(16.w),
          Positioned(
            right: -70,
            bottom: 0.h,
            child: Image.asset(
              "assets/images/home_header_car.png",
              width: 290.w,
              height: 130.h,
            ),
          ),
        ],
      ),
    );
  }
}
