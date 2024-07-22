import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../config/routing/routes.dart';
import '../config/text/text_styles.dart';
import '../config/theme/colors_manager.dart';
import '../helpers/extensions/extensions.dart';

class SearchBarWidget extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;
  final VoidCallback? onSuffixIconTap;

  const SearchBarWidget({
    super.key,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.onTap,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap ?? context.pushNamed(Routes.searchScreen);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
          color: backgroundColor ?? Colors.transparent,
          border: Border.all(
            color: borderColor ?? ColorsManager.lightGrey,
          ),
        ),
        child: Row(
          children: [
            prefixIcon ??
                SvgPicture.asset(
                  "assets/icons/search_icon.svg",
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.lightGrey,
                    BlendMode.srcIn,
                  ),
                ),
            Gap(8.w),
            Text(
              hintText ?? "Search",
              style: hintStyle ?? TextStyles.font12LightGreyMedium,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                onSuffixIconTap ?? context.successSnackBar("Barcode");
              },
              child: suffixIcon ??
                  SvgPicture.asset(
                    "assets/icons/barcode_icon.svg",
                    colorFilter: const ColorFilter.mode(
                      ColorsManager.lightGrey,
                      BlendMode.srcIn,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
