import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/products_list_item_widget.dart';
import '../../../../../core/widgets/shimmer_loading_widget.dart';
import '../../../../home/domain/entities/home_product_entity.dart';
import '../../logic/product_cubit.dart';

class SimilarProductsListWidget extends StatelessWidget {
  const SimilarProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
        bloc: context.read<ProductCubit>(),
        buildWhen: (previous, current) {
          if (current is SimilarProductsLoading ||
              current is SimilarProductsLoaded ||
              current is SimilarProductsError) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is SimilarProductsLoading) {
            return _buildProductsLoading();
          } else if (state is SimilarProductsLoaded) {
            return _buildProductsList(state.products);
          } else if (state is SimilarProductsError) {
            return Center(
              child:
                  Text(state.failure.message ?? "").setHorizontalPadding(16.w),
            );
          } else {
            return const SizedBox();
          }
        });
  }

  Widget _buildProductsLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerLoadingWidget(
          width: 150.w,
          height: 20.h,
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        SizedBox(
          height: 295.h,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: Container(
                  height: 270.h,
                  width: 150.w,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ).setOnlyPadding(0, 0, 8.w, 0),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductsList(List<HomeProductEntity> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Products Related To This",
          style: TextStyles.font14DarkBlueSemiBold,
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        SizedBox(
          height: 295.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductsListItemWidget(product: products[index])
                  .setOnlyPadding(0, 0, 8.w, 0);
            },
          ),
        ),
      ],
    );
  }
}
