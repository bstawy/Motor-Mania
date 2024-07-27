import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';

PersistentTabConfig bottomNavBarTab({
  required Widget screen,
  required String title,
  required String iconPath,
  required String inactiveIconPath,
}) {
  return PersistentTabConfig(
    screen: screen,
    item: ItemConfig(
      title: title,
      textStyle: TextStyles.font14RedSemiBold,
      icon: SvgPicture.asset(
        iconPath,
        width: 24.w,
        height: 24.h,
      ),
      inactiveIcon: SvgPicture.asset(
        inactiveIconPath,
        width: 24.w,
        height: 24.h,
      ),
      activeForegroundColor: ColorsManager.red,
      activeColorSecondary: Colors.white,
    ),
  );
}
