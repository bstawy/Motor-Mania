import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/helpers/enums/app_modes_enums.dart';
import '../logic/home_cubit/home_cubit.dart';
import '../logic/user_cubit/user_cubit.dart';
import 'widgets/categories/categories_list_widget.dart';
import 'widgets/header/home_header_widget.dart';
import 'widgets/header/user/user_offers_widget.dart';
import 'widgets/home_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppMode appMode = context.read<AppManagerCubit>().appMode;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: ColorfulSafeArea(
          color: ColorsManager.darkBlue,
          child: RefreshIndicator(
            onRefresh: () async {
              if (appMode == AppMode.user) {
                context.read<UserCubit>().fetchUserData();
              }
              context.read<HomeCubit>()
                ..getHomeOffers()
                ..getHomeCategories()
                ..getHomeProducts();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeaderWidget(),
                  Visibility(
                    visible:
                        context.read<AppManagerCubit>().appMode == AppMode.user,
                    maintainState: false,
                    child: Column(
                      children: [
                        Gap(16.h),
                        const UserOffersWidget(),
                      ],
                    ),
                  ),
                  Gap(16.h),
                  const CategoriesList(),
                  Gap(24.h),
                  const HomeListWidget(title: "Recommended For You"),
                  Gap(16.h),
                  const HomeListWidget(title: "BestSellers"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
