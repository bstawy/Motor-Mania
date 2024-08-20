import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../features/home/domain/entities/home_product_entity.dart';
import '../../features/product_details/presentation/ui/widgets/product_price_and_discount_widget.dart';
import '../config/text/text_styles.dart';
import '../config/theme/colors_manager.dart';
import '../helpers/extensions/extensions.dart';
import '../helpers/open_product_bottom_sheet.dart';
import 'cart_button_widget.dart';
import 'favorite_button_widget.dart';
import 'product_name_and_type_widget.dart';
import 'product_property_widget.dart';

class ProductItemWidget extends StatelessWidget {
  final HomeProductEntity product;
  final double? cardWidth;
  final double? imageHeight;
  final bool? showDiscount;

  const ProductItemWidget({
    super.key,
    required this.product,
    this.cardWidth,
    this.imageHeight,
    this.showDiscount = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openProductBottomSheet(context: context, productId: product.id ?? 0);
      },
      child: Container(
        width: cardWidth ?? 150.w,
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
                Gap(28.h),
                CachedNetworkImage(
                  imageUrl: product.imageUrl ?? "",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.darkBlue,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: ColorsManager.red,
                  ),
                  height: imageHeight ?? 88.h,
                ),
                Gap(12.h),
                ProductPropertyWidget(
                  title: "${product.rating} (${product.reviewsCount})",
                  iconPath: "assets/icons/star_icon.svg",
                  titleStyle: TextStyles.font8BlueGreyMedium,
                ),
                ProductNameAndTypeWidget(
                  name: product.name ?? "",
                  type: product.compatibleCars?.first.brand ?? "",
                ),
                Gap(6.h),
                ProductPriceAndDiscountWidget(
                  price: product.price ?? 0,
                  firstGap: 4.w,
                  oldPrice: product.oldPrice ?? 0,
                  secondGap: 4.w,
                  priceStyle: TextStyles.font14DarkBlueBold,
                  oldPriceStyle: TextStyles.font10BlueGreyRegular,
                  discountPercentage: showDiscount ?? true
                      ? product.discountPercentage ?? 0
                      : null,
                  discountPercentageStyle: TextStyles.font7RedSemiBold,
                ),
                Gap(5.h),
                ProductPropertyWidget(
                  title: product.freeDelivery ?? true
                      ? "Free Delivery"
                      : "Verified Seller",
                  iconPath: product.freeDelivery ?? true
                      ? "assets/icons/free_delivery_filled_icon.svg"
                      : "assets/icons/verify_icon.svg",
                ),
                Gap(8.h),
                CartButtonWidget(product: product),
              ],
            ).setHorizontalPadding(8.w),
            Positioned(
              right: 0,
              child: FavoriteButtonWidget(product: product),
            ),
            Visibility(
              visible: product.newProduct ?? false || product.amount! < 3,
              child: Positioned(
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: product.newProduct ?? false
                        ? ColorsManager.red
                        : ColorsManager.darkBlue,
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
