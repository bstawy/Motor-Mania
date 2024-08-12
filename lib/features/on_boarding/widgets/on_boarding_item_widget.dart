import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/text_styles.dart';
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
            style: TextStyles.font24DarkBlueSemiBold,
            children: [
              TextSpan(
                text: onBoarding.subtitle,
                style: TextStyles.font24RedSemiBold.copyWith(
                  fontSize: 40.sp,
                ),
              ),
            ],
          ),
        ).setHorizontalPadding(24.w),
        Gap(16.h),
        Text(
          onBoarding.description,
          style: TextStyles.font12BlueGreyRegular,
        ).setHorizontalPadding(24.w),
      ],
    );
  }
}
