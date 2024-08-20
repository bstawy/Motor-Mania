import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/routing/routes.dart';
import '../../../../../../../core/config/text/text_styles.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/helpers/save_navigation_data.dart';
import '../../../../../../../core/widgets/search_bar_widget.dart';
import 'guest_offers_widget.dart';

class GuestHeaderWidget extends StatelessWidget {
  const GuestHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello, ',
                style: TextStyles.font14WhiteLite,
                children: [
                  TextSpan(
                    text: 'User',
                    style: TextStyles.font14WhiteSemiBold,
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
                    style: TextStyles.font14WhiteSemiBold,
                  ),
                ),
                Text(
                  'First to get all App\'s advantages',
                  style: TextStyles.font14WhiteLite,
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
