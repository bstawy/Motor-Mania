import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../features/cart/presentation/logic/cart_cubit.dart';
import '../../features/home/domain/entities/home_product_entity.dart';
import '../config/text/text_styles.dart';
import '../config/theme/colors_manager.dart';
import '../helpers/extensions/extensions.dart';
import '../helpers/open_product_bottom_sheet.dart';
import 'favorite_button_widget.dart';

class ProductsListItemWidget extends StatelessWidget {
  final HomeProductEntity product;

  const ProductsListItemWidget({
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
        width: 150.w,
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
                  width: 104.w,
                  height: 88.h,
                  child: Image.network(product.imageUrl ?? ""),
                ),
                Gap(12.h),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/star_icon.svg"),
                    Text(
                      "${product.rating} (${product.reviewsCount})",
                      style: TextStyles.font8LightGreyMedium,
                    ),
                  ],
                ),
                Text(
                  product.name ?? "",
                  style: TextStyles.font16DarkBlueBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.compatibleCars?.first.brand ?? "",
                  style: TextStyles.font10DarkBlueRegular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(6.h),
                Row(
                  children: [
                    Text(
                      "\$${product.price?.toStringAsFixed(2)}",
                      style: TextStyles.font16DarkBlueBold,
                    ),
                    Gap(6.w),
                    Text(
                      "\$${product.oldPrice?.toStringAsFixed(2)}",
                      style: TextStyles.font10LightGreyRegular.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Gap(3.h),
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
                  child: InkWell(
                    onTap: () {
                      context
                          .read<CartCubit>()
                          .addProductToCart(product.id!, 1);
                    },
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
                  ),
                ),
              ],
            ).setHorizontalPadding(8.w),
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
