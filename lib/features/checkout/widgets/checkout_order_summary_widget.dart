import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/text_styles.dart';
import '../../../core/helpers/extensions/padding_ext.dart';
import '../../cart/presentation/ui/widgets/cart_details_widget.dart';

class CheckoutOrderSummaryWidget extends StatelessWidget {
  const CheckoutOrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Summary",
          style: TextStyles.font14DarkBlueMedium,
        ),
        Gap(8.h),
        const CartDetailsWidget(),
      ],
    ).setHorizontalPadding(16.w);
  }
}
