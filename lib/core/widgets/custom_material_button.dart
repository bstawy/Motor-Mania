import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../config/text/text_styles.dart';
import '../config/theme/colors_manager.dart';

class CustomMaterialButton extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final double? height, width, elevation, borderRadius, borderWidth;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor, borderColor;
  final Widget? prefixWidget;
  final Widget? child;
  final bool enabled, loading;
  final VoidCallback onClicked;

  const CustomMaterialButton({
    super.key,
    this.title,
    this.titleStyle,
    this.height,
    this.width,
    this.elevation,
    this.borderRadius,
    this.borderWidth,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.prefixWidget,
    this.child,
    this.loading = false,
    this.enabled = true,
    required this.onClicked,
  });
  // TODO: needs refactoring
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (enabled && !loading) {
          onClicked();
        }
      },
      enableFeedback: !loading,
      height: height ?? 56.h,
      minWidth: width ?? double.maxFinite,
      elevation: elevation ?? 0,
      padding: padding,
      color: loading || !enabled
          ? (backgroundColor ?? ColorsManager.grey).withOpacity(0.5)
          : (backgroundColor ?? ColorsManager.darkkBlue),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 1.w,
        ),
      ),
      child: loading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : child ??
              (prefixWidget != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        prefixWidget!,
                        Gap(8.w),
                        Text(
                          title ?? "Continue",
                          style: titleStyle ?? TextStyles.font16WhiteSemiBold,
                        ),
                      ],
                    )
                  : Text(
                      title ?? "Continue",
                      style: titleStyle ?? TextStyles.font16WhiteSemiBold,
                    )),
    );
  }
}
