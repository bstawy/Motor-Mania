import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:motor_mania/core/config/text/font_weight_helper.dart';
import 'package:motor_mania/core/helpers/extensions/theme_ext.dart';

import '../../../core/config/routing/routes.dart';
import '../../../core/helpers/extensions/extensions.dart';

class OnBoardingSkipButtonWidget extends StatelessWidget {
  const OnBoardingSkipButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: context.colors.inverseSurface,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: IconButton(
        onPressed: () => context.pushReplacementNamed(Routes.layoutScreen),
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0.r),
            ),
          ),
        ),
        icon: Row(
          children: [
            Text(
              "Skip",
              style: context.textStyles.headlineMedium?.copyWith(
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            Gap(8.w),
            Icon(
              Icons.arrow_forward_ios,
              color: context.colors.primary,
              size: 20.r,
            ),
          ],
        ),
      ),
    );
  }
}
