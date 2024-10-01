import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/enums/app_modes_enums.dart';
import '../../cars/presentation/logic/cars_cubit.dart';
import '../../cart/presentation/logic/cart_cubit.dart';
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
  }

  @override
  void didChangeDependencies() {
    getTabIndex();
    super.didChangeDependencies();
  }

  getTabIndex() {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    if (args != null) {
      controller.jumpToTab(args);
    }
  }

  // TODO: show exit confirmation Dialog when back from home screen
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
    AppManagerCubit appManager = context.read<AppManagerCubit>();

    return PersistentTabView(
      controller: controller,
      navBarHeight: 70.h,
      navBarOverlap: const NavBarOverlap.none(),
      selectedTabContext: (context) {},
      onTabChanged: (value) {
        if (value == 3 && context.read<CartCubit>().state is CartLoaded) {
          context.read<LayoutCubit>().openBottomSheet();
        } else {
          context.read<LayoutCubit>().closeBottomSheet();
        }
      },
      tabs: _buildTabs(appManager, context),
      navBarBuilder: (navBarConfig) {
        return BlocBuilder<LayoutCubit, LayoutState>(
          bloc: context.read<LayoutCubit>(),
          builder: (BuildContext context, state) {
            return Style2BottomNavBar(
              navBarConfig: navBarConfig,
              navBarDecoration: NavBarDecoration(
                color: ColorsManager.darkBlue,
                border: Border.all(width: 0),
                borderRadius: state is BottomSheetOpenedState
                    ? BorderRadius.zero
                    : BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                shape: BoxShape.rectangle,
              ),
            );
          },
        );
      },
    );
  }

  List<PersistentTabConfig> _buildTabs(
      AppManagerCubit appManager, BuildContext context) {
    return [
      bottomNavBarTab(
        screen: MultiBlocProvider(
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
        screen: MultiBlocProvider(
          providers: [
            BlocProvider<GarageCubit>(
              create: (context) => getIt<GarageCubit>()..getGarageCars(),
            ),
            BlocProvider<CarsCubit>(
              create: (context) => getIt<CarsCubit>(),
            ),
          ],
          child: const GarageScreen(),
        ),
        iconPath: "assets/icons/bottom_nav_selected_garage_icon.svg",
        inactiveIconPath: "assets/icons/bottom_nav_unselected_garage_icon.svg",
        title: "Garage",
      ),
      bottomNavBarTab(
        screen: const CartScreen(),
        iconPath: "assets/icons/bottom_nav_selected_cart_icon.svg",
        inactiveIconPath: "assets/icons/bottom_nav_unselected_cart_icon.svg",
        title: "Cart",
      ),
      bottomNavBarTab(
        screen: BlocProvider(
          create: (context) => ProfileCubit(),
          child: const ProfileScreen(),
        ),
        iconPath: "assets/icons/bottom_nav_selected_profile_icon.svg",
        inactiveIconPath: "assets/icons/bottom_nav_unselected_profile_icon.svg",
        title: "Profile",
      ),
    ];
  }
}
