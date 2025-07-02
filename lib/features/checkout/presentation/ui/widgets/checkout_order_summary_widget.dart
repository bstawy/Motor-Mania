import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/padding_ext.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../cart/presentation/ui/widgets/cart_details_widget.dart';

class CheckoutOrderSummaryWidget extends StatelessWidget {
  const CheckoutOrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Summary",
          style: customTextStyles.headlineMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Gap(8.h),
        const CartDetailsWidget(),
      ],
    ).setHorizontalPadding(16.w);
  }
}
