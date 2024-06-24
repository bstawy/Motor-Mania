import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/text/text_styles.dart';
import '../config/theme/colors_manager.dart';

class CustomMaterialButton extends StatelessWidget {
  final String? title;
  final double? height, width, elevation, borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor, borderColor;
  final double? borderWidth;
  final TextStyle? titleStyle;
  final Widget? child;
  final bool enabled;
  final bool loading;
  final VoidCallback onClicked;

  const CustomMaterialButton({
    super.key,
    required this.onClicked,
    this.title,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.elevation,
    this.titleStyle,
    this.child,
    this.enabled = true,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (enabled && !loading) {
          onClicked();
        }
      },
      height: height ?? 56.h,
      minWidth: width ?? double.maxFinite,
      elevation: elevation,
      padding: padding,
      color: loading
          ? (backgroundColor ?? ColorsManager.grey).withOpacity(0.5)
          : (backgroundColor ?? ColorsManager.darkkBlue),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 1.w,
        ),
      ),
      child: loading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              title ?? "Continue",
              style: titleStyle ?? TextStyles.font16WhiteSemiBold,
            ),
    );
  }
}
