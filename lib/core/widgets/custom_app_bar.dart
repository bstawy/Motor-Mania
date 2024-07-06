import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extensions/extensions.dart';
import 'custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final double? topPadding, downPadding, rightPadding, leftPadding;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.topPadding,
    this.downPadding,
    this.rightPadding,
    this.leftPadding,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      leading: leading ?? const CustomBackButton(),
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          : const SizedBox.shrink(),
      actions: actions,
      centerTitle: false,
    ).setOnlyPadding(topPadding ?? 8.h, downPadding ?? 0, rightPadding ?? 0,
        leftPadding ?? 0);
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0.h);
}
