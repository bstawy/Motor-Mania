import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../core/config/theme/colors_manager.dart';
import 'widgets/best_sellers_widget.dart';
import 'widgets/categories/categories_widget.dart';
import 'widgets/home_header_widget.dart';
import 'widgets/offers_widget.dart';
import 'widgets/recommended_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isUserLogged = context.read<AppManagerCubit>().isUserLoggedIn;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: ColorfulSafeArea(
          color: ColorsManager.darkkBlue,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeaderWidget(),
                    Gap(95.h),
                    const CategoriesWidget(),
                    Gap(24.h),
                    const RecommendedWidget(),
                    Gap(16.h),
                    const BestSellersWidget(),
                  ],
                ),
                Positioned(
                  top: isUserLogged ? 285.h : 80.h,
                  left: 0,
                  right: 0,
                  child: const OffersWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
