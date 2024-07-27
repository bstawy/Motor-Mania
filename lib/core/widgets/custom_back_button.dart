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
    return Container(
      width: 48.r,
      height: 48.r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
      ),
      child: IconButton(
        onPressed: onPressed ?? () => Navigator.of(context).pop(),
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15.0.r),
            ),
          ),
        ),
        icon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 12.0.r,
            vertical: verticalPadding ?? 0.0.r,
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.darkkBlue,
          ),
        ),
      ),
    );
  }
}
