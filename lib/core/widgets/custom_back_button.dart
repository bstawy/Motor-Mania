import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/colors_manager.dart';

class CustomBackButton extends StatelessWidget {
  final double? width, height, paddingValue, borderRadiusValue;
  final VoidCallback? onPressed;

  const CustomBackButton({
    super.key,
    this.width,
    this.height,
    this.paddingValue,
    this.borderRadiusValue,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.r,
      height: 48.r,
      padding: EdgeInsets.symmetric(horizontal: paddingValue ?? 12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: IconButton(
        onPressed: onPressed ?? () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: ColorsManager.darkkBlue,
        ),
      ),
    );
  }
}
