import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../config/text/text_styles.dart';

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
    return Row(
      children: [
        Text(
          "\$${finalPrice.toStringAsFixed(2)}",
          style: TextStyles.font14DarkBlueBold,
        ),
        Gap(6.w),
        oldPrice != null
            ? Text(
                "\$${oldPrice!.toStringAsFixed(2)}",
                style: TextStyles.font10BlueGreyRegular.copyWith(
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
                    style: TextStyles.font7RedSemiBold,
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
