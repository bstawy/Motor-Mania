import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../core/config/text/text_styles.dart';
import '../../core/config/theme/colors_manager.dart';
import '../home/presentation/home_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  PersistentTabConfig _buildBottomNavBarItem({
    required Widget screen,
    required String iconPath,
    required String inactiveIconPath,
    required String title,
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

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70.h,
      navBarOverlap: const NavBarOverlap.none(),
      tabs: [
        _buildBottomNavBarItem(
          screen: const HomeScreen(),
          iconPath: "assets/icons/bottom_nav_selected_home_icon.svg",
          inactiveIconPath: "assets/icons/bottom_nav_unselected_home_icon.svg",
          title: "Home",
        ),
        _buildBottomNavBarItem(
          screen: Scaffold(
            body: Center(
              child: Text(
                "Favorites",
                style: TextStyles.font20DarkBlueBold,
              ),
            ),
          ),
          iconPath: "assets/icons/bottom_nav_selected_favorite_icon.svg",
          inactiveIconPath:
              "assets/icons/bottom_nav_unselected_favorite_icon.svg",
          title: "Favorites",
        ),
        _buildBottomNavBarItem(
          screen: Scaffold(
            body: Center(
              child: Text(
                "My Garage",
                style: TextStyles.font20DarkBlueBold,
              ),
            ),
          ),
          iconPath: "assets/icons/bottom_nav_selected_garage_icon.svg",
          inactiveIconPath:
              "assets/icons/bottom_nav_unselected_garage_icon.svg",
          title: "Garage",
        ),
        _buildBottomNavBarItem(
          screen: Scaffold(
            body: Center(
              child: Text(
                "Cart",
                style: TextStyles.font20DarkBlueBold,
              ),
            ),
          ),
          iconPath: "assets/icons/bottom_nav_selected_cart_icon.svg",
          inactiveIconPath: "assets/icons/bottom_nav_unselected_cart_icon.svg",
          title: "Cart",
        ),
        _buildBottomNavBarItem(
          screen: Scaffold(
            body: Center(
              child: Text(
                "Profile",
                style: TextStyles.font20DarkBlueBold,
              ),
            ),
          ),
          iconPath: "assets/icons/bottom_nav_selected_profile_icon.svg",
          inactiveIconPath:
              "assets/icons/bottom_nav_unselected_profile_icon.svg",
          title: "Profile",
        ),
      ],
      navBarBuilder: (navBarConfig) {
        return Style2BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: ColorsManager.darkkBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.w),
          ),
        );
      },
    );
  }
}
