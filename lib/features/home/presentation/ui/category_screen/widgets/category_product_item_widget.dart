import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/config/text/text_styles.dart';
import '../../../../../../core/config/theme/colors_manager.dart';
import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../domain/entities/product_entity.dart';

class CategoryProductItemWidget extends StatelessWidget {
  final ProductEntity product;

  const CategoryProductItemWidget({
    super.key,
    required this.product,
  });

  num calculatePriceAfterDiscount(num actualPrice, num discountPercentage) {
    final discountPrice = actualPrice * (discountPercentage / 100);
    return actualPrice - discountPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167.w,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(32.h),
              SizedBox(
                height: 95.h,
                child: Image.network(product.imageUrl),
              ).setHorizontalPadding(8.w),
              Gap(12.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/star_icon.svg"),
                  Text(
                    "${product.rating} (${product.reviewsCount})",
                    style: TextStyles.font8LightGreyMedium,
                  ),
                ],
              ).setHorizontalPadding(8.w),
              Text(
                product.name,
                style: TextStyles.font14DarkBlueBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ).setHorizontalPadding(8.w),
              Text(
                "Ferrari",
                style: TextStyles.font10DarkBlueRegular,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ).setHorizontalPadding(8.w),
              Gap(6.h),
              Row(
                children: [
                  Text(
                    "\$${calculatePriceAfterDiscount(product.price, product.discountPercentage).toStringAsFixed(2)}",
                    style: TextStyles.font14DarkBlueBold,
                  ),
                  Gap(6.w),
                  Text(
                    "\$${product.price}",
                    style: TextStyles.font10LightGreyRegular.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Gap(4.w),
                  Text(
                    "${product.discountPercentage}% OFF",
                    style: TextStyles.font7RedSemiBold,
                  ),
                ],
              ).setHorizontalPadding(8.w),
              Gap(6.h),
              Row(
                children: [
                  SvgPicture.asset(
                    product.freeDelivery
                        ? "assets/icons/free_delivery_filled_icon.svg"
                        : "assets/icons/verify_icon.svg",
                  ),
                  Gap(4.w),
                  Text(
                    product.freeDelivery ? "Free Delivery" : "Verified Seller",
                    style: TextStyles.font8LightGreyMedium.copyWith(
                      color: ColorsManager.darkkBlue,
                    ),
                  ),
                ],
              ).setHorizontalPadding(8.w),
              Gap(8.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: ColorsManager.red,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/cart_icon.svg"),
                    Gap(6.w),
                    Text(
                      "Add to cart",
                      style: TextStyles.font10WhiteMedium,
                    ),
                  ],
                ),
              ).setHorizontalPadding(8.w),
            ],
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 28.r,
                height: 28.r,
                padding: EdgeInsets.all(6.r),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.lighterGrey,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/icons/favorite_icon.svg",
                  width: 16.r,
                  height: 16.r,
                ),
              ),
            ),
          ),
          Visibility(
            visible: product.newProduct || product.amount < 5,
            child: Positioned(
              left: 0,
              child: Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: product.newProduct
                      ? ColorsManager.red
                      : const Color(0xff171823),
                ),
                alignment: Alignment.center,
                child: Text(
                  product.newProduct ? "NEW" : "only ${product.amount} left",
                  style: TextStyles.font7WhiteMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
