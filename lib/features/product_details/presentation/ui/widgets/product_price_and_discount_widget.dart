import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../motor_mania_app.dart';

class ProductPriceAndDiscountWidget extends StatelessWidget {
  final num price;
  final num oldPrice;
  final num? discountPercentage;
  final TextStyle? priceStyle;
  final TextStyle? oldPriceStyle;
  final TextStyle? discountPercentageStyle;
  final double? firstGap, secondGap;

  const ProductPriceAndDiscountWidget({
    super.key,
    required this.price,
    required this.oldPrice,
    this.discountPercentage,
    this.priceStyle,
    this.oldPriceStyle,
    this.discountPercentageStyle,
    this.firstGap,
    this.secondGap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "\$${price.toStringAsFixed(2)}",
          style: priceStyle ?? customTextStyles.displayLarge,
        ),
        Gap(firstGap ?? 16.w),
        Text(
          "\$${oldPrice.toStringAsFixed(2)}",
          style:
              oldPriceStyle?.copyWith(decoration: TextDecoration.lineThrough) ??
                  TextStyles.font14BlueGreyRegular.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
        ),
        discountPercentage == null
            ? const SizedBox()
            : Row(
                children: [
                  Gap(secondGap ?? 8.w),
                  Text(
                    "$discountPercentage% OFF",
                    overflow: TextOverflow.ellipsis,
                    style:
                        discountPercentageStyle ?? TextStyles.font14RedSemiBold,
                  ),
                ],
              ),
      ],
    );
  }
}
