import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/open_product_bottom_sheet.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/product_name_and_type_widget.dart';
import '../../../../../core/widgets/product_price_widget.dart';
import '../../../../../core/widgets/product_property_widget.dart';
import '../../../domain/entities/cart_product_entity.dart';

class CartProductItemWidget extends StatelessWidget {
  final CartProductEntity cartProduct;

  const CartProductItemWidget({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openProductBottomSheet(
          context: context,
          productId: cartProduct.product.id ?? "",
        );
      },
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 113.w,
                  height: 102.h,
                  child: Image.network(cartProduct.product.imageUrl ?? ""),
                ),
                Gap(12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductNameAndTypeWidget(
                      name: cartProduct.product.name ?? "",
                      type:
                          cartProduct.product.compatibleCars?.first.brand ?? "",
                    ),
                    Gap(10.h),
                    ProductPriceWidget(
                      finalPrice: cartProduct.product.price ?? 0,
                      oldPrice: cartProduct.product.oldPrice ?? 0,
                      discountPercentage:
                          cartProduct.product.discountPercentage,
                    ),
                    Gap(8.h),
                    Text(
                      "Order in 16h 34m,",
                      style: TextStyles.font10DarkBlueMedium,
                    ),
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
                    Gap(5.h),
                    Row(
                      children: [
                        const ProductPropertyWidget(
                          title: "Free Delivery",
                          iconPath:
                              "assets/icons/free_delivery_filled_icon.svg",
                        ),
                        Gap(13.w),
                        const ProductPropertyWidget(
                          title: "Verified Seller",
                          iconPath: "assets/icons/verify_icon.svg",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Gap(16.h),
            SizedBox(
              height: 26.h,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // TODO: change product amount
                    },
                    child: Container(
                      height: 26.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: const Color(0xffDFE2E7),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            cartProduct.quantity.toString(),
                            style: TextStyles.font10LightGreySemiBold,
                          ),
                          Gap(4.w),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18.r,
                            color: ColorsManager.lightGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(8.w),
                  CustomElevatedButton(
                    onPressed: () {
                      // TODO: remove product from cart
                    },
                    title: "Remove",
                    iconPath: "assets/icons/trash_icon.svg",
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () {
                      // TODO: add to favorites and remove from cart
                    },
                    title: "Move To Favorites",
                    iconPath: "assets/icons/favorite_light_icon.svg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
