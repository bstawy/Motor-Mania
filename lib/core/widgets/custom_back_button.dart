import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/colors_manager.dart';

class CustomBackButton extends StatelessWidget {
  final double? width, height, horizontalPadding, verticalPadding, borderRadius;
  final VoidCallback? onPressed;

  const CustomBackButton({
    super.key,
    this.width,
    this.height,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderRadius,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.of(context).pop(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 14.w,
          vertical: verticalPadding ?? 8.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            borderRadius ?? 15.r,
          ),
        ),
        alignment: Alignment.center,
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.darkBlue,
            size: 20.r,
          ),
        ),
      ),
    );
  }
}
