import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../core/caching/tokens_manager.dart';
import '../../core/config/app_manager/app_manager_cubit.dart';
import '../../core/config/routing/routes.dart';
import '../../core/config/text/text_styles.dart';
import '../../core/config/theme/colors_manager.dart';
import '../../core/di/dependency_injection.dart';
import '../../core/helpers/extensions/extensions.dart';
import '../../core/widgets/custom_material_button.dart';
import '../home/presentation/logic/home_cubit.dart';
import '../home/presentation/ui/home_screen/home_screen.dart';
import 'bottom_nav_bar_tab.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70.h,
      navBarOverlap: const NavBarOverlap.none(),
      handleAndroidBackButtonPress: false,
      tabs: [
        bottomNavBarTab(
          screen: BlocProvider<HomeCubit>(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
          iconPath: "assets/icons/bottom_nav_selected_home_icon.svg",
          inactiveIconPath: "assets/icons/bottom_nav_unselected_home_icon.svg",
          title: "Home",
        ),
        bottomNavBarTab(
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
        bottomNavBarTab(
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
        bottomNavBarTab(
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
        bottomNavBarTab(
          screen: Scaffold(
            body: Center(
              child: context.read<AppManagerCubit>().isUserLoggedIn
                  ? CustomMaterialButton(
                      onClicked: () async {
                        await TokensManager.deleteTokens();
                        if (context.mounted) {
                          context.read<AppManagerCubit>().checkUserLoggedIn();
                          context.pushNamedAndRemoveUntil(Routes.layoutScreen,
                              predicate: (route) => false);
                        }
                      },
                      backgroundColor: ColorsManager.red,
                      title: "Logout",
                    ).setHorizontalPadding(60.w)
                  : CustomMaterialButton(
                      onClicked: () {
                        context.pushNamed(Routes.loginScreen);
                      },
                      backgroundColor: ColorsManager.red,
                      title: "Login",
                    ).setHorizontalPadding(60.w),
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
