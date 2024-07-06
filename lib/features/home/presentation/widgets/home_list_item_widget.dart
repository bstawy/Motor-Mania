import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../data/models/product_model.dart';

class HomeListItem extends StatelessWidget {
  final ProductModel product;

  const HomeListItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167.w,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(24.h),
              SizedBox(
                width: 100.w,
                height: 85.h,
                child: Image.asset(product.imagePath),
              ),
              Gap(12.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/star_icon.svg"),
                  Text(
                    "${product.rating} (${product.reviewCount})",
                    style: TextStyles.font8LightGreyRegular,
                  ),
                ],
              ),
              Text(
                product.name,
                style: TextStyles.font16DarkBlueBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                product.carModel,
                style: TextStyles.font10DarkBlueRegular,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(6.h),
              Row(
                children: [
                  Text(
                    "\$${product.priceAfterDiscount}",
                    style: TextStyles.font16DarkBlueBold,
                  ),
                  Gap(6.w),
                  Text(
                    "\$${product.price}",
                    style: TextStyles.font10LightGreyRegular.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              Gap(6.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/verify_icon.svg"),
                  Text(
                    "Verified Seller",
                    style: TextStyles.font8LightGreyBold.copyWith(
                      color: ColorsManager.darkkBlue,
                    ),
                  ),
                ],
              ),
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
              )
            ],
          ).setHorizontalPadding(8.w),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(6.r),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.lighterGrey,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/icons/favorite_icon.svg"),
              ),
            ),
          ),
          product.isNew
              ? Positioned(
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: ColorsManager.red,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "NEW",
                      style: TextStyles.font7WhiteMedium,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
