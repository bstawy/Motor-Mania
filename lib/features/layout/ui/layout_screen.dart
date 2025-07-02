import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../core/config/theme/colors/colors_manager.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/enums/app_modes_enums.dart';
import '../../../core/helpers/extensions/theme_ext.dart';
import '../../../main.dart';
import '../../cars/presentation/logic/cars_cubit.dart';
import '../../cart/presentation/ui/cart_screen.dart';
import '../../favorites/presentation/ui/favorites_screen.dart';
import '../../garage/presentation/logic/garage_cubit.dart';
import '../../garage/presentation/ui/garage_screen.dart';
import '../../home/presentation/logic/home_cubit/home_cubit.dart';
import '../../home/presentation/logic/user_cubit/user_cubit.dart';
import '../../home/presentation/ui/home_screen.dart';
import '../../profile/presentation/logic/profile_cubit.dart';
import '../../profile/presentation/ui/profile_screen.dart';
import '../logic/layout_cubit.dart';
import 'widgets/bottom_nav_bar_tab.dart';
import 'widgets/exit_confirmation_dialog_widget.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<LayoutCubit>().controller;
    _checkFirstTimeUser();
  }

  @override
  void didChangeDependencies() {
    getTabIndex();
    super.didChangeDependencies();
  }

  void _checkFirstTimeUser() {
    if (context.read<AppManagerCubit>().isFirstTimeUser) {
      context.read<AppManagerCubit>().setFirstTimeUser(false);
    }
  }

  getTabIndex() {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    if (args != null) {
      controller.jumpToTab(args);
    }
  }

  _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return const ExitConfirmationDialogWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagerCubit, AppManagerState>(
      builder: (context, state) {
        return BlocBuilder<LayoutCubit, LayoutState>(
          bloc: context.read<LayoutCubit>(),
          builder: (context, state) {
            return PersistentTabView(
              context,
              controller: controller,
              screens: _buildScreens(),
              items: _navBarsItems(),
              hideNavigationBarWhenKeyboardAppears: true,
              handleAndroidBackButtonPress: true,
              onWillPop: (context) async {
                return await _showExitConfirmationDialog(context!);
              },
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 17.h),
              backgroundColor: ColorsManager.darkBlue,
              confineToSafeArea: true,
              navBarHeight: 70.h,
              navBarStyle: NavBarStyle.style7,
              decoration: NavBarDecoration(
                borderRadius: state is BottomSheetOpenedState
                    ? BorderRadius.zero
                    : BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                colorBehindNavBar: context.colors.surface,
              ),
              animationSettings: const NavBarAnimationSettings(
                navBarItemAnimation: ItemAnimationSettings(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimationSettings(
                  animateTabTransition: true,
                  duration: Duration(milliseconds: 300),
                  screenTransitionAnimationType:
                      ScreenTransitionAnimationType.slide,
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<Widget> _buildScreens() {
    final AppManagerCubit appManager =
        navigatorKey.currentContext!.read<AppManagerCubit>();
    return [
      MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => getIt<HomeCubit>(),
          ),
          if (appManager.appMode == AppMode.user)
            BlocProvider<UserCubit>(
              create: (context) => getIt<UserCubit>(),
            ),
        ],
        child: const HomeScreen(),
      ),
      const FavoritesScreen(),
      MultiBlocProvider(
        providers: [
          BlocProvider<GarageCubit>(
            create: (context) => getIt<GarageCubit>(),
          ),
          BlocProvider<CarsCubit>(
            create: (context) => getIt<CarsCubit>(),
          ),
        ],
        child: const GarageScreen(),
      ),
      const CartScreen(),
      BlocProvider(
        create: (context) => ProfileCubit(),
        child: const ProfileScreen(),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      bottomNavBarTab(
        title: "Home",
        activeIconPath: "assets/icons/bottom_nav_selected_home_icon.svg",
        inactiveIconPath: "assets/icons/bottom_nav_unselected_home_icon.svg",
      ),
      bottomNavBarTab(
        title: "Favorites",
        activeIconPath: "assets/icons/bottom_nav_selected_favorite_icon.svg",
        inactiveIconPath:
            "assets/icons/bottom_nav_unselected_favorite_icon.svg",
      ),
      bottomNavBarTab(
        title: "Garage",
        activeIconPath: "assets/icons/bottom_nav_selected_garage_icon.svg",
        inactiveIconPath: "assets/icons/bottom_nav_unselected_garage_icon.svg",
      ),
      bottomNavBarTab(
        title: "Cart",
        activeIconPath: "assets/icons/bottom_nav_selected_cart_icon.svg",
        inactiveIconPath: "assets/icons/bottom_nav_unselected_cart_icon.svg",
      ),
      bottomNavBarTab(
        title: "Profile",
        activeIconPath: "assets/icons/bottom_nav_selected_profile_icon.svg",
        inactiveIconPath: "assets/icons/bottom_nav_unselected_profile_icon.svg",
      ),
    ];
  }
}
