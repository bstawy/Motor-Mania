import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/config/routing/app_router.dart';
import '../../../../core/config/text/font_weight_helper.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/helpers/extensions/theme_ext.dart';

PersistentBottomNavBarItem bottomNavBarTab({
  required String title,
  required String activeIconPath,
  required String inactiveIconPath,
}) {
  return PersistentBottomNavBarItem(
    icon: SvgPicture.asset(
      activeIconPath,
      width: 24.w,
      height: 24.h,
    ),
    inactiveIcon: SvgPicture.asset(
      inactiveIconPath,
      width: 24.w,
      height: 24.h,
    ),
    title: title,
    activeColorPrimary: Colors.white,
    activeColorSecondary: ColorsManager.red,
    textStyle: AppRouter.navigatorKey.currentContext!.textStyles.headlineMedium
        ?.copyWith(
      color: ColorsManager.red,
      fontWeight: FontWeightHelper.semiBold,
    ),
  );
}
