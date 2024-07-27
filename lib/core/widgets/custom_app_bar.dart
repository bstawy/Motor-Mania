import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extensions/extensions.dart';
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
    return AppBar(
      forceMaterialTransparency: true,
      leading: leading ?? CustomBackButton(onPressed: onLeadingPressed),
      title: Text(title ?? ""),
      titleTextStyle: titleStyle ??
          TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
      actions: actions,
      centerTitle: centerTitle,
    ).setOnlyPadding(
      topPadding ?? 8.h,
      bottomPadding ?? 0,
      rightPadding ?? 0,
      leftPadding ?? 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60.0.h);
}
