import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/texts/font_weight_helper.dart';
import '../helpers/extensions/extensions.dart';
import '../helpers/extensions/theme_ext.dart';
import 'custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final double? height;
  final double? topPadding, bottomPadding, rightPadding, leftPadding;
  final VoidCallback? onLeadingPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.centerTitle = false,
    this.leading,
    this.actions,
    this.height,
    this.topPadding,
    this.bottomPadding,
    this.rightPadding,
    this.leftPadding,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    return AppBar(
      forceMaterialTransparency: true,
      leading: leading ?? CustomBackButton(onPressed: onLeadingPressed),
      leadingWidth: 40.w,
      title: Text(title ?? ""),
      titleTextStyle: titleStyle ??
          customTextStyles.headlineMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
      actions: actions,
      centerTitle: centerTitle,
    ).setOnlyPadding(
      topPadding ?? 8.h,
      bottomPadding ?? 0,
      rightPadding ?? 16.w,
      leftPadding ?? 16.w,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 50.0.h);
}
