import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';

class StockAndShippingInfoWidget extends StatelessWidget {
  const StockAndShippingInfoWidget({
    super.key,
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
            Text(
              "Only 2 Left ",
              style: TextStyles.font12RedSemiBold,
            ),
            Text(
              "in Stock",
              style: TextStyles.font12DarkBlueMedium,
            ),
          ],
        ),
        Gap(4.h),
        Text(
          "Shipping in two days",
          style: TextStyles.font12DarkBlueMedium,
        ),
      ],
    );
  }
}
