import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';

class StockAndShippingInfoWidget extends StatelessWidget {
  final int amount;
  final String shippingInfo;

  const StockAndShippingInfoWidget({
    super.key,
    required this.amount,
    required this.shippingInfo,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              context.themeIsDark
                  ? AssetsManager.lowStockDarkIcon
                  : AssetsManager.lowStockIcon,
              width: 14.w,
              height: 14.h,
            ),
            Gap(4.w),
            Visibility(
              visible: amount < 5,
              replacement: Text(
                "In Stock",
                style: customTextStyles.headlineSmall?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    "Only $amount Left ",
                    style: customTextStyles.headlineSmall?.copyWith(
                      color: ColorsManager.red,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                  Text(
                    "in Stock",
                    style: customTextStyles.headlineSmall?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(4.h),
        Text(
          shippingInfo,
          style: customTextStyles.headlineSmall?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
      ],
    );
  }
}
