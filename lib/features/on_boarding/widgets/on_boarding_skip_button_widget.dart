import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/routing/routes.dart';
import '../../../core/config/text/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/helpers/extensions/extensions.dart';

class OnBoardingSkipButtonWidget extends StatelessWidget {
  const OnBoardingSkipButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
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
              style: TextStyles.font14DarkBlueSemiBold,
            ),
            Gap(8.w),
            Icon(
              Icons.arrow_forward_ios,
              color: ColorsManager.darkBlue,
              size: 24.r,
            ),
          ],
        ),
      ),
    );
  }
}
