import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:popover/popover.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/helpers/open_product_bottom_sheet.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_network_image_widget.dart';
import '../../../../../core/widgets/product_name_and_type_widget.dart';
import '../../../../../core/widgets/product_price_widget.dart';
import '../../../../../core/widgets/product_property_widget.dart';
import '../../../../../core/widgets/quantity_pop_up_widget.dart';
import '../../../../favorites/presentation/logic/favorites_cubit.dart';
import '../../../domain/entities/cart_product_entity.dart';
import '../../logic/cart_cubit.dart';

class CartProductItemWidget extends StatelessWidget {
  final CartProductEntity cartProduct;

  const CartProductItemWidget({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return GestureDetector(
      onTap: () {
        openProductBottomSheet(
          context: context,
          productId: cartProduct.product.id ?? 0,
        );
      },
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: customColors.inverseSurface,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 113.w,
                  height: 102.h,
                  child: CustomNetworkImage(
                    url: cartProduct.product.imageUrl ?? "",
                  ),
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
                      style: customTextStyles.labelLarge?.copyWith(
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Get It ',
                        style: customTextStyles.labelLarge,
                        // TextStyles.font10DarkBlueBold,
                        children: [
                          TextSpan(
                            text: 'by ',
                            style: customTextStyles.labelLarge?.copyWith(
                              fontWeight: FontWeightHelper.medium,
                            ),
                          ),
                          TextSpan(
                            text: 'Fri, 12 July',
                            style: customTextStyles.labelLarge?.copyWith(
                              color: ColorsManager.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(5.h),
                    Row(
                      children: [
                        ProductPropertyWidget(
                          title: "Free Delivery",
                          iconPath: AssetsManager.freeDeliveryFilledIcon,
                        ),
                        Gap(13.w),
                        ProductPropertyWidget(
                          title: "Verified Seller",
                          iconPath: AssetsManager.verifiedSellerIcon,
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
                      showPopover(
                        context: context,
                        bodyBuilder: (context) => const QuantityPopUpWidget(),
                        direction: PopoverDirection.bottom,
                        backgroundColor: customColors.inverseSurface,
                        height: 50.h,
                        width: 177.w,
                        radius: 12.r,
                        arrowDxOffset: -150.w,
                        arrowDyOffset: -20.h,
                        arrowWidth: 0,
                      );
                    },
                    child: Container(
                      height: 26.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: customColors.onSecondary,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            cartProduct.quantity.toString(),
                            style: customTextStyles.labelLarge?.copyWith(
                              color: ColorsManager.blueGrey,
                              fontWeight: FontWeightHelper.semiBold,
                            ),
                          ),
                          Gap(4.w),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18.r,
                            color: ColorsManager.blueGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(8.w),
                  CustomElevatedButton(
                    onPressed: () {
                      context
                          .read<CartCubit>()
                          .removeProductFromCart(cartProduct.product.id ?? 0);
                    },
                    title: "Remove",
                    iconPath: AssetsManager.trashIcon,
                    //  "assets/icons/trash_icon.svg",
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () {
                      // TODO: Fix issue product removed from cart but not added to favorite
                      context
                          .read<FavoritesCubit>()
                          .addToFavorites(cartProduct);
                      context
                          .read<CartCubit>()
                          .removeProductFromCart(cartProduct.product.id ?? 0);
                    },
                    title: "Move To Favorites",
                    iconPath: AssetsManager.favoriteLightIcon,
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
