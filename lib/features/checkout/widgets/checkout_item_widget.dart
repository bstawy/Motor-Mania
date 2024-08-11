import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/widgets/product_name_and_type_widget.dart';
import '../../../core/widgets/product_price_widget.dart';
import '../../cart/domain/entities/cart_product_entity.dart';

class CheckoutItemWidget extends StatelessWidget {
  final CartProductEntity cartProduct;
  final bool? isFirst;
  final bool? isLast;

  const CheckoutItemWidget({
    super.key,
    required this.cartProduct,
    this.isFirst,
    this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius? radius;

    if (isFirst!) {
      radius = BorderRadius.only(
        topLeft: Radius.circular(15.r),
        bottomLeft: Radius.circular(15.r),
      );
    } else if (isLast!) {
      radius = BorderRadius.only(
        topRight: Radius.circular(15.r),
        bottomRight: Radius.circular(15.r),
      );
    } else {
      radius = BorderRadius.zero;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius,
      ),
      child: Row(
        children: [
          isFirst!
              ? const SizedBox()
              : Container(
                  margin: EdgeInsets.only(right: 16.w),
                  width: 1.5.w,
                  height: double.infinity,
                  color: ColorsManager.lighterGrey,
                ),
          SizedBox(
            width: 70.w,
            height: 70.h,
            child: Image.network(cartProduct.product.imageUrl ?? ""),
          ),
          Gap(12.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductNameAndTypeWidget(
                name: cartProduct.product.name ?? "",
                type: cartProduct.product.compatibleCars?.first.brand ?? "",
                nameStyle: TextStyles.font12DarkBlueSemiBold,
                typeStyle: TextStyles.font8DarkBlueRegular,
              ),
              Gap(4.h),
              ProductPriceWidget(
                finalPrice: cartProduct.product.price ?? 0,
                finalPriceStyle: TextStyles.font12DarkBlueBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Get It ',
                      style: TextStyles.font10DarkBlueBold,
                      children: [
                        TextSpan(
                          text: 'by ',
                          style: TextStyles.font10DarkBlueMedium,
                        ),
                        TextSpan(
                          text: 'Fri, 12 July',
                          style: TextStyles.font10RedBold,
                        ),
                      ],
                    ),
                  ),
*/