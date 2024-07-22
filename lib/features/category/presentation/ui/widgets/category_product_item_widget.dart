import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/open_product_bottom_sheet.dart';
import '../../../../../core/widgets/favorite_button_widget.dart';
import '../../../../home/domain/entities/home_product_entity.dart';

class CategoryProductItemWidget extends StatelessWidget {
  final HomeProductEntity product;

  const CategoryProductItemWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openProductBottomSheet(context: context, productId: product.id ?? "");
      },
      child: Container(
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
                  child: Image.network(product.imageUrl ?? ""),
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
                  product.name ?? "",
                  style: TextStyles.font14DarkBlueBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).setHorizontalPadding(8.w),
                Text(
                  product.compatibleCars?.first.brand ?? "",
                  style: TextStyles.font10DarkBlueRegular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).setHorizontalPadding(8.w),
                Gap(6.h),
                Row(
                  children: [
                    Text(
                      "\$${product.price?.toStringAsFixed(2)}",
                      style: TextStyles.font14DarkBlueBold,
                    ),
                    Gap(6.w),
                    Text(
                      "\$${product.oldPrice?.toStringAsFixed(2)}",
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
                      product.freeDelivery ?? true
                          ? "assets/icons/free_delivery_filled_icon.svg"
                          : "assets/icons/verify_icon.svg",
                    ),
                    Gap(4.w),
                    Text(
                      product.freeDelivery ?? true
                          ? "Free Delivery"
                          : "Verified Seller",
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
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/cart_icon.svg",
                        width: 16.r,
                        height: 16.r,
                      ),
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
              child: FavoriteButtonWidget(product: product),
            ),
            Visibility(
              visible: product.newProduct ?? false || product.amount! < 5,
              child: Positioned(
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: product.newProduct ?? false
                        ? ColorsManager.red
                        : const Color(0xff171823),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    product.newProduct ?? false
                        ? "NEW"
                        : "only ${product.amount} left",
                    style: TextStyles.font7WhiteMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
