import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../core/config/routing/routes.dart';
import '../../../core/config/text/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/enums/app_modes_enums.dart';
import '../../../core/helpers/extensions/extensions.dart';
import '../../../core/widgets/custom_material_button.dart';
import '../../cart/presentation/logic/cart_cubit.dart';
import '../../cart/presentation/ui/cart_screen.dart';
import '../../favorites/presentation/ui/favorites_screen.dart';
import '../../home/presentation/logic/home_cubit/home_cubit.dart';
import '../../home/presentation/ui/home_screen.dart';
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
    controller = PersistentTabController(initialIndex: 0);
    context.read<LayoutCubit>().controller = controller;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getTabIndex();
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
      selectedTabContext: (context) {
        if (controller.index == 3) {
          final state = context.read<CartCubit>().state;
          if (state is CartLoaded && state.cartProducts.isNotEmpty) {
            getIt<LayoutCubit>().openBottomSheet();
          } else {
            getIt<LayoutCubit>().closeBottomSheet();
          }
        }
      },
      onTabChanged: (value) {
        if (value != 3 && context.read<LayoutCubit>().isBottomSheetOpen) {
          context.read<LayoutCubit>().closeBottomSheet();
        }
      },
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
          screen: const CartScreen(),
          iconPath: "assets/icons/bottom_nav_selected_cart_icon.svg",
          inactiveIconPath: "assets/icons/bottom_nav_unselected_cart_icon.svg",
          title: "Cart",
        ),
        bottomNavBarTab(
          screen: Scaffold(
            body: Center(
              child: appManager.appMode == AppMode.user
                  ? CustomMaterialButton(
                      onClicked: () async {
                        await context.read<AppManagerCubit>().logUserOut();
                        if (context.mounted) {
                          context.pushNamedAndRemoveUntil(
                            Routes.layoutScreen,
                            predicate: (route) => false,
                          );
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
}
