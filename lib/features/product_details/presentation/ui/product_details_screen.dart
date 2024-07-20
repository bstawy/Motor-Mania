import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../../home/presentation/logic/home_cubit.dart';
import '../../../home/presentation/ui/widgets/home_list_widget.dart';
import 'widgets/product_description_widget.dart';
import 'widgets/product_image_and_rating_widget.dart';
import 'widgets/product_name_and_favorite_button_widget.dart';
import 'widgets/product_price_and_discount_widget.dart';
import 'widgets/product_quantity_and_add_to_cart_button_widget.dart';
import 'widgets/product_specifications_widget.dart';
import 'widgets/seller_info_widget.dart';
import 'widgets/stock_and_shipping_info_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final HomeProductEntity product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>.value(
      value: getIt<HomeCubit>(),
      child: Column(
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
                            color: ColorsManager.grey,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                        Gap(16.h),
                        const SearchBarWidget(backgroundColor: Colors.white),
                        Gap(16.h),
                        ProductNameAndFavoriteButtonWidget(product: product),
                        Gap(16.r),
                        ProductImageAndRatingWidget(product: product),
                        Gap(24.h),
                        ProductPriceAndDiscountWidget(product: product),
                        Gap(8.h),
                        const StockAndShippingInfoWidget(),
                        Gap(12.h),
                        const ProductSpecificationsWidget(),
                        Gap(16.h),
                        const ProductDescriptionWidget(),
                        Gap(16.h),
                        SellerInfoWidget(product: product),
                      ],
                    ).setHorizontalPadding(16.w),
                    Gap(16.h),
                    const HomeListWidget(title: "Products Related To This"),
                  ],
                ).setOnlyPadding(4.h, 0, 0, 0);
              },
            ),
          ),
          const ProductQuantityAndAddToCartButtonWidget()
        ],
      ),
    );
  }
}
