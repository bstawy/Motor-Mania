import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../home/domain/entities/home_product_entity.dart';

class ProductPriceAndDiscountWidget extends StatelessWidget {
  final HomeProductEntity product;

  const ProductPriceAndDiscountWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "\$${product.price?.toStringAsFixed(2)}",
          style: TextStyles.font32DarkBlueBold,
        ),
        Gap(16.w),
        Text(
          "\$${product.oldPrice?.toStringAsFixed(2)}",
          style: TextStyles.font14GreyRegular.copyWith(
            decoration: TextDecoration.lineThrough,
          ),
        ),
        Gap(8.w),
        Text(
          "${product.discountPercentage}% OFF",
          style: TextStyles.font14RedSemiBold,
        ),
      ],
    );
  }
}
