import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/padding_ext.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';

class CheckoutAddressWidget extends StatelessWidget {
  const CheckoutAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Address",
          style: customTextStyles.headlineMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Gap(8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: customColors.inverseSurface,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset(AssetsManager.locationIcon),
              Gap(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deliver to",
                    style: customTextStyles.labelLarge?.copyWith(
                      color: ColorsManager.blueGrey,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  Gap(4.h),
                  Text(
                    "1234 Street Name, City Name",
                    style: customTextStyles.labelLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: customColors.primary,
                  size: 20.r,
                ),
              ),
            ],
          ),
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
