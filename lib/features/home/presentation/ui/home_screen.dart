import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/theme/colors_manager.dart';
import 'widgets/best_sellers_widget.dart';
import 'widgets/categories/categories_widget.dart';
import 'widgets/home_header.dart';
import 'widgets/offers_widget.dart';
import 'widgets/recommended_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    RecommendedWidget(),
                    Gap(16.h),
                    BestSellersWidget(),
                  ],
                ),
                Positioned(
                  top: 285.h,
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
