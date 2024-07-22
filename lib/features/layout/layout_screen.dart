import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../core/config/app_manager/app_manager_cubit.dart';
import '../../core/config/routing/routes.dart';
import '../../core/config/text/text_styles.dart';
import '../../core/config/theme/colors_manager.dart';
import '../../core/di/dependency_injection.dart';
import '../../core/helpers/extensions/extensions.dart';
import '../../core/widgets/custom_material_button.dart';
import '../favorites/presentation/ui/favorites_screen.dart';
import '../home/presentation/logic/home_cubit.dart';
import '../home/presentation/ui/home_screen.dart';
import 'bottom_nav_bar_tab.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppManagerCubit appManager = context.read<AppManagerCubit>();

    return PersistentTabView(
      navBarHeight: 70.h,
      navBarOverlap: const NavBarOverlap.none(),
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
          screen: const FavoritesScreen(),
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
              child: appManager.isUserLoggedIn
                  ? CustomMaterialButton(
                      onClicked: () {
                        context.read<AppManagerCubit>().logUserOut();
                        context.pushNamedAndRemoveUntil(Routes.layoutScreen,
                            predicate: (route) => false);
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
        return BlocBuilder<AppManagerCubit, AppManagerState>(
          bloc: appManager,
          buildWhen: (previous, current) {
            if (current is BottomSheetClosedState ||
                current is BottomSheetOpenedState) {
              return true;
            }
            return false;
          },
          builder: (BuildContext context, state) {
            return Style2BottomNavBar(
              navBarConfig: navBarConfig,
              navBarDecoration: NavBarDecoration(
                color: ColorsManager.darkkBlue,
                border: Border.all(
                  width: 0,
                ),
                borderRadius: state is BottomSheetOpenedState
                    ? BorderRadius.zero
                    : BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                padding: EdgeInsets.symmetric(horizontal: 8.w),
              ),
            );
          },
        );
      },
    );
  }
}
