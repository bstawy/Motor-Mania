import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/save_navigation_data.dart';
import '../../../../../core/widgets/search_bar_widget.dart';
import 'home_guest_offers_widget.dart';

class HomeGuestHeaderWidget extends StatelessWidget {
  const HomeGuestHeaderWidget({super.key});

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
                    saveNavigationData(
                      Routes.layoutScreen,
                      null,
                    );
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
        const HomeGuestOffersWidget().setHorizontalPadding(8.w),
      ],
    );
  }
}
