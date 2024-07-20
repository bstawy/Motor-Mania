import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../home/domain/entities/home_product_entity.dart';

class ProductNameAndFavoriteButtonWidget extends StatelessWidget {
  final HomeProductEntity product;

  const ProductNameAndFavoriteButtonWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name ?? '',
              style: TextStyles.font24DarkBlueBold,
            ),
            Text(
              '${product.compatibleCars?.first.brand} ${product.compatibleCars?.first.model}',
              style: TextStyles.font14DarkBlueRegular,
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 40.w,
          height: 40.h,
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/icons/favorite_icon.svg",
            width: 24.r,
            height: 24.r,
          ),
        ),
      ],
    );
  }
}
