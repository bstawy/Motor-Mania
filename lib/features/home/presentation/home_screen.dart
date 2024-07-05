import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/text_styles.dart';
import '../../../core/helpers/extensions/extensions.dart';
import 'widgets/best_seller_grid_view.dart';
import 'widgets/categories_filter_widget.dart';
import 'widgets/home_header.dart';
import 'widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeaderWidget(),
                Gap(40.h),
                CategoriesFilterWidget(),
                Gap(24.h),
                Text(
                  "Best Sellers",
                  style: TextStyles.font20DarkBlueBold,
                ).setHorizontalPadding(16.w),
                Gap(8.h),
                BestSellerGridWidget(),
              ],
            ),
            Positioned(
              top: 278.h,
              left: 0,
              right: 0,
              child: const SearchBarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
