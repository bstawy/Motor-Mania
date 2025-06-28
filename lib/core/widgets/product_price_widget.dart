import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../config/theme/colors/colors_manager.dart';
import '../config/theme/texts/font_weight_helper.dart';
import '../helpers/extensions/theme_ext.dart';

class ProductPriceWidget extends StatelessWidget {
  final num finalPrice;
  final num? oldPrice, discountPercentage;
  final TextStyle? oldPriceStyle, finalPriceStyle, discountPercentageStyle;

  const ProductPriceWidget({
    super.key,
    required this.finalPrice,
    this.oldPrice,
    this.discountPercentage,
    this.oldPriceStyle,
    this.finalPriceStyle,
    this.discountPercentageStyle,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Row(
      children: [
        Text(
          "\$${finalPrice.toStringAsFixed(2)}",
          style: customTextStyles.headlineMedium,
        ),
        Gap(6.w),
        oldPrice != null
            ? Text(
                "\$${oldPrice!.toStringAsFixed(2)}",
                style: customTextStyles.labelLarge?.copyWith(
                  color: ColorsManager.blueGrey,
                  fontWeight: FontWeightHelper.regular,
                  decoration: TextDecoration.lineThrough,
                ),
              )
            : const SizedBox(),
        discountPercentage != null
            ? Row(
                children: [
                  Gap(4.w),
                  Text(
                    "$discountPercentage% OFF",
                    style: customTextStyles.labelSmall,
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
