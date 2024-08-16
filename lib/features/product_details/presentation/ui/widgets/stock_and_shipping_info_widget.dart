import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/low_stock_icon.svg",
              width: 14.w,
              height: 14.h,
            ),
            Gap(4.w),
            Visibility(
              visible: amount < 5,
              replacement: Text(
                "In Stock",
                style: TextStyles.font12DarkBlueMedium,
              ),
              child: Row(
                children: [
                  Text(
                    "Only $amount Left ",
                    style: TextStyles.font12RedSemiBold,
                  ),
                  Text(
                    "in Stock",
                    style: TextStyles.font12DarkBlueMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(4.h),
        Text(
          shippingInfo,
          style: TextStyles.font12DarkBlueMedium,
        ),
      ],
    );
  }
}
