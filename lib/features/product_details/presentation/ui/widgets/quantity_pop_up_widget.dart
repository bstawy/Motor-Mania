import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:motor_mania/core/config/text/text_styles.dart';
import 'package:motor_mania/core/config/theme/colors_manager.dart';
import 'package:motor_mania/core/helpers/extensions/extensions.dart';

class QuantityPopUpWidget extends StatelessWidget {
  const QuantityPopUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildQuantityButton(text: "1", onTap: () {}),
        Gap(8.w),
        _buildQuantityButton(text: "2", onTap: () {}),
        Gap(8.w),
        _buildQuantityButton(text: "3", onTap: () {}),
        Gap(8.w),
        _buildQuantityButton(text: "4", onTap: () {}),
      ],
    ).setHorizontalAndVerticalPadding(12.w, 8.h);
  }

  Widget _buildQuantityButton(
      {required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: ColorsManager.lighterGrey,
            width: 1.w,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyles.font14DarkBlueSemiBold,
        ),
      ),
    );
  }
}
