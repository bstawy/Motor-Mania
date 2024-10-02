import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:motor_mania/core/config/text/font_weight_helper.dart';
import 'package:motor_mania/core/config/theme/colors_manager.dart';
import 'package:motor_mania/core/helpers/extensions/theme_ext.dart';

import '../../../core/helpers/extensions/extensions.dart';
import '../on_boarding_model.dart';

class OnBoardingItemWidget extends StatelessWidget {
  final OnBoardingModel onBoarding;

  const OnBoardingItemWidget({
    super.key,
    required this.onBoarding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: onBoarding.imageAlignment,
          child: Image.asset(
            onBoarding.image,
            height: 280.h,
            width: 307.w,
            fit: BoxFit.contain,
          ),
        ),
        Gap(53.h),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: "${onBoarding.title}\n",
            style: context.textStyles.displayMedium?.copyWith(
              fontWeight: FontWeightHelper.semiBold,
            ),
            children: [
              TextSpan(
                text: onBoarding.subtitle,
                style: context.textStyles.displayMedium?.copyWith(
                  color: ColorsManager.red,
                  fontSize: 40.sp,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ],
          ),
        ).setHorizontalPadding(24.w),
        Gap(16.h),
        Text(
          onBoarding.description,
          style: context.textStyles.headlineSmall?.copyWith(
            color: ColorsManager.blueGrey,
            fontWeight: FontWeightHelper.regular,
          ),
        ).setHorizontalPadding(24.w),
      ],
    );
  }
}
