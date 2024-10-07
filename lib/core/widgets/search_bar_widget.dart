import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../config/routing/routes.dart';
import '../config/theme/colors/colors_manager.dart';
import '../config/theme/texts/font_weight_helper.dart';
import '../helpers/extensions/extensions.dart';

class SearchBarWidget extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon, suffixIcon;
  final double? borderRadius, borderWidth;
  final Color? backgroundColor, borderColor;
  final VoidCallback? onTap, onSuffixIconTap;

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
    final theme = Theme.of(context).textTheme;

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
            color: borderColor ?? ColorsManager.blueGrey,
          ),
        ),
        child: Row(
          children: [
            prefixIcon ??
                SvgPicture.asset(
                  "assets/icons/search_icon.svg",
                  colorFilter: ColorFilter.mode(
                    borderColor ?? ColorsManager.blueGrey,
                    BlendMode.srcIn,
                  ),
                ),
            Gap(6.w),
            Text(
              hintText ?? "What are you looking for?",
              style: hintStyle ??
                  theme.labelLarge?.copyWith(
                    color: ColorsManager.blueGrey,
                    fontWeight: FontWeightHelper.light,
                  ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // TODO: open qrcode scanner
                onSuffixIconTap ?? context.successSnackBar("Barcode");
              },
              child: suffixIcon ??
                  SvgPicture.asset(
                    "assets/icons/barcode_icon.svg",
                    colorFilter: ColorFilter.mode(
                      borderColor ?? ColorsManager.blueGrey,
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

extension on BuildContext {
  get textStyles => null;
}
