import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';

class ProductPriceAndDiscountWidget extends StatelessWidget {
  final num price;
  final num oldPrice;
  final num discountPercentage;

  const ProductPriceAndDiscountWidget({
    super.key,
    required this.price,
    required this.oldPrice,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "\$${price.toStringAsFixed(2)}",
          style: TextStyles.font32DarkBlueBold,
        ),
        Gap(16.w),
        Text(
          "\$${oldPrice.toStringAsFixed(2)}",
          style: TextStyles.font14GreyRegular.copyWith(
            decoration: TextDecoration.lineThrough,
          ),
        ),
        Gap(8.w),
        Text(
          "$discountPercentage% OFF",
          style: TextStyles.font14RedSemiBold,
        ),
      ],
    );
  }
}
