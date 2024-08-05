import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../config/text/text_styles.dart';
import '../config/theme/colors_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final String? iconPath;
  final Color? backgroundColor, shadowColor, borderColor;
  final Color? iconColor;
  final double? borderRadiusValue, horizontalPadding, verticalPadding;
  final double? iconWidth, iconHeight;
  final TextStyle? titleStyle;
  final Function()? onPressed;

  const CustomElevatedButton({
    super.key,
    required this.title,
    this.iconPath,
    this.backgroundColor,
    this.shadowColor,
    this.borderColor,
    this.iconColor,
    this.borderRadiusValue,
    this.horizontalPadding,
    this.verticalPadding,
    this.iconWidth,
    this.iconHeight,
    this.titleStyle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.transparent,
        shadowColor: shadowColor ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue ?? 8.r),
          side: BorderSide(
            color: borderColor ?? ColorsManager.whiteBlue,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 8.0.w,
          vertical: verticalPadding ?? 5.0.h,
        ),
      ),
      child: Row(
        children: [
          iconPath != null
              ? SvgPicture.asset(
                  iconPath!,
                  width: iconWidth ?? 12.w,
                  height: iconHeight ?? 12.h,
                )
              : const SizedBox(),
          iconPath != null ? Gap(4.w) : const SizedBox(),
          Text(
            title,
            style: titleStyle ?? TextStyles.font8BlueGreyMedium,
          ),
        ],
      ),
    );
  }
}
