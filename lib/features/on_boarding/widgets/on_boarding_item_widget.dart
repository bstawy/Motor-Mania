import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/font_weight_helper.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/helpers/extensions/extensions.dart';
import '../../../core/helpers/extensions/theme_ext.dart';
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
          child: Padding(
            padding: EdgeInsets.only(
              left: onBoarding.leftPadding,
              right: onBoarding.rightPadding,
            ),
            child: Image.asset(
              onBoarding.image,
              height: 280.h,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
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
