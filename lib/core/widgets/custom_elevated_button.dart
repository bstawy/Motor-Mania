import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../config/theme/colors/colors_manager.dart';
import '../config/theme/texts/font_weight_helper.dart';
import '../helpers/extensions/theme_ext.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? title;
  final String? iconPath;
  final Color? backgroundColor, shadowColor, borderColor;
  final Color? iconColor;
  final double? borderRadiusValue, horizontalPadding, verticalPadding;
  final double? iconWidth, iconHeight, borderWidth;

  final TextStyle? titleStyle;
  final Function()? onPressed;

  const CustomElevatedButton({
    super.key,
    this.title,
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
    this.borderWidth,
    this.titleStyle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    bool isIcon = iconPath != null && title == null;
    bool isTitle = iconPath == null && title != null;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.transparent,
        shadowColor: shadowColor ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue ?? 8.r),
          side: BorderSide(
            color: borderColor ?? customColors.onSecondary,
            width: borderWidth ?? 1.0.w,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 8.0.w,
          vertical: verticalPadding ?? 5.0.h,
        ),
      ),
      child: isIcon
          ? SvgPicture.asset(
              iconPath!,
              width: iconWidth ?? 12.w,
              height: iconHeight ?? 12.h,
              colorFilter: ColorFilter.mode(
                iconColor ?? ColorsManager.blueGrey,
                BlendMode.srcIn,
              ),
            )
          : isTitle
              ? Text(
                  title!,
                  style: titleStyle ??
                      customTextStyles.labelMedium?.copyWith(
                        color: ColorsManager.blueGrey,
                        fontWeight: FontWeightHelper.medium,
                      ),
                )
              : Row(
                  children: [
                    SvgPicture.asset(
                      iconPath!,
                      width: iconWidth ?? 12.w,
                      height: iconHeight ?? 12.h,
                      colorFilter: ColorFilter.mode(
                        iconColor ?? ColorsManager.blueGrey,
                        BlendMode.srcIn,
                      ),
                    ),
                    Gap(4.w),
                    Text(
                      title!,
                      style: titleStyle ??
                          customTextStyles.labelMedium?.copyWith(
                            color: ColorsManager.blueGrey,
                            fontWeight: FontWeightHelper.medium,
                          ),
                    ),
                  ],
                ),
    );
  }
}
