import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/routing/routes.dart';
import '../../../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../../../core/helpers/save_navigation_data.dart';
import '../../../../../../../core/widgets/search_bar_widget.dart';
import 'guest_offers_widget.dart';

class GuestHeaderWidget extends StatelessWidget {
  const GuestHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello, ',
                style: customTextStyles.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeightHelper.light,
                ),
                children: [
                  TextSpan(
                    text: 'User',
                    style: customTextStyles.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(4.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    saveNavigationData(Routes.layoutScreen, 0);
                    context.pushNamed(Routes.loginScreen);
                  },
                  child: Text(
                    "Login ",
                    style: customTextStyles.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                ),
                Text(
                  'First to get all App\'s advantages',
                  style: customTextStyles.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeightHelper.light,
                  ),
                ),
              ],
            ),
            Gap(12.h),
            const SearchBarWidget(),
          ],
        ).setHorizontalPadding(16.w),
        Gap(24.h),
        const GuestOffersWidget(),
      ],
    );
  }
}
