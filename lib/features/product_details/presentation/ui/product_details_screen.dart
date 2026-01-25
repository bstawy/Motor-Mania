import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/helpers/extensions/padding_ext.dart';
import '../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../../domain/entities/product_entity.dart';
import 'widgets/product_description_widget.dart';
import 'widgets/product_image_and_rating_widget.dart';
import 'widgets/product_name_and_favorite_button_widget.dart';
import 'widgets/product_price_and_discount_widget.dart';
import 'widgets/product_quantity_and_add_to_cart_button_widget.dart';
import 'widgets/product_specifications_widget.dart';
import 'widgets/seller_info_widget.dart';
import 'widgets/stock_and_shipping_info_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LayoutCubit>().isProductDetailsBottomSheetOpen = true;
  }

  // @override
  // void dispose() {
  //   context.read<LayoutCubit>().isProductDetailsBottomSheetOpen = false;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;

    return Column(
      children: [
        Expanded(
          child: DraggableScrollableSheet(
            initialChildSize: 1,
            maxChildSize: 1,
            minChildSize: 0.7,
            builder: (context, scrollController) {
              return ListView(
                controller: scrollController,
                children: [
                  Column(
                    children: [
                      Gap(8.h),
                      Container(
                        height: 5.h,
                        margin: EdgeInsets.symmetric(horizontal: 0.4.sw),
                        decoration: BoxDecoration(
                          color: customColors.onTertiary,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      ),
                      Gap(16.h),
                      const SearchBarWidget(
                        borderColor: ColorsManager.blueGrey,
                      ),
                      Gap(16.h),
                      ProductNameAndFavoriteButtonWidget(
                        product: widget.product,
                      ),
                      Gap(16.r),
                      ProductImageAndRatingWidget(
                        imageUrl: widget.product.imageUrl ?? "",
                        rating: widget.product.rating ?? 0,
                        reviewsCount: widget.product.reviewsCount ?? 0,
                      ),
                      Gap(24.h),
                      ProductPriceAndDiscountWidget(
                        oldPrice: widget.product.oldPrice ?? 0,
                        price: widget.product.price ?? 0,
                        discountPercentage:
                            widget.product.discountPercentage ?? 0,
                      ),
                      Gap(8.h),
                      StockAndShippingInfoWidget(
                        amount: widget.product.amount ?? 0,
                        shippingInfo: widget.product.shippingInformation ?? "",
                      ),
                      Gap(12.h),
                      const ProductSpecificationsWidget(),
                      Gap(16.h),
                      ProductDescriptionWidget(
                        description: widget.product.description ?? "",
                      ),
                      Gap(16.h),
                      const SellerInfoWidget(),
                    ],
                  ).setHorizontalPadding(16.w),
                  Gap(16.h),
                ],
              ).setOnlyPadding(4.h, 0, 0, 0);
            },
          ),
        ),
        const ProductQuantityAndAddToCartButtonWidget(),
      ],
    );
  }
}
