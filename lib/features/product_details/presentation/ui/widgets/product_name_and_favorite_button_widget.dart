import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/text/text_styles.dart';
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name ?? "",
              style: TextStyles.font24DarkBlueBold,
            ),
            Text(
              "${product.compatibleCars?.first.brand} ${product.compatibleCars?.first.model}",
              style: TextStyles.font14DarkBlueRegular,
            ),
          ],
        ),
        const Spacer(),
        FavoriteButtonWidget(
          product: product,
          width: 40.w,
          height: 40.h,
          backgroundColor: Colors.white,
          iconHeight: 24.r,
          iconWidth: 24.r,
        ),
      ],
    );
  }
}
