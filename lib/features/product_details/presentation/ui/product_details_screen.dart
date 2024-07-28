import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../../../favorites/presentation/logic/favorites_cubit.dart';
import '../../../home/presentation/logic/home_cubit/home_cubit.dart';
import '../../../home/presentation/ui/widgets/home_list_widget.dart';
import '../../domain/entities/product_entity.dart';
import '../logic/product_cubit.dart';
import 'widgets/product_description_widget.dart';
import 'widgets/product_image_and_rating_widget.dart';
import 'widgets/product_name_and_favorite_button_widget.dart';
import 'widgets/product_price_and_discount_widget.dart';
import 'widgets/product_quantity_and_add_to_cart_button_widget.dart';
import 'widgets/product_specifications_widget.dart';
import 'widgets/seller_info_widget.dart';
import 'widgets/stock_and_shipping_info_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  BlocBuilder<ProductCubit, ProductState>(
                    bloc: context.read<ProductCubit>(),
                    buildWhen: (previous, current) {
                      if (current is ProductLoading ||
                          current is ProductLoaded ||
                          current is ProductError) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ProductLoaded) {
                        bool isFavorite = context
                            .read<FavoritesCubit>()
                            .isFavorite(state.product.id ?? "");

                        ProductEntity product =
                            state.product.copyWith(isFavorite: isFavorite);

                        return Column(
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
                            const SearchBarWidget(
                              backgroundColor: Colors.white,
                            ),
                            Gap(16.h),
                            ProductNameAndFavoriteButtonWidget(
                              product: product,
                            ),
                            Gap(16.r),
                            ProductImageAndRatingWidget(
                              imageUrl: product.imageUrl ?? "",
                              rating: product.rating ?? 0,
                              reviewsCount: product.reviewsCount ?? 0,
                            ),
                            Gap(24.h),
                            ProductPriceAndDiscountWidget(
                              oldPrice: product.oldPrice ?? 0,
                              price: product.price ?? 0,
                              discountPercentage:
                                  product.discountPercentage ?? 0,
                            ),
                            Gap(8.h),
                            StockAndShippingInfoWidget(
                              amount: product.amount ?? 0,
                              shippingInfo: product.shippingInformation ?? "",
                            ),
                            Gap(12.h),
                            const ProductSpecificationsWidget(),
                            Gap(16.h),
                            const ProductDescriptionWidget(
                              description:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            ),
                            Gap(16.h),
                            const SellerInfoWidget(),
                          ],
                        );
                      } else if (state is ProductError) {
                        return Center(
                          child: Text(state.failure.message ?? "Error"),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ).setHorizontalPadding(16.w),
                  Gap(16.h),
                  BlocProvider<HomeCubit>(
                    create: (context) => getIt<HomeCubit>(),
                    child:
                        const HomeListWidget(title: "Products Related To This"),
                  ),
                ],
              ).setOnlyPadding(4.h, 0, 0, 0);
            },
          ),
        ),
        const ProductQuantityAndAddToCartButtonWidget()
      ],
    );
  }
}
