import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/favorite_button_widget.dart';
import '../../../domain/entities/product_entity.dart';

class ProductNameAndFavoriteButtonWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductNameAndFavoriteButtonWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name ?? "",
              style: customTextStyles.displayMedium,
            ),
            Text(
              "${product.compatibleCars?.first.brand} ${product.compatibleCars?.first.model}",
              style: customTextStyles.headlineMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ],
        ),
        const Spacer(),
        FavoriteButtonWidget(
          product: product,
          width: 40.w,
          height: 40.h,
          backgroundColor: customColors.inversePrimary,
          iconHeight: 24.r,
          iconWidth: 24.r,
        ),
      ],
    );
  }
}
