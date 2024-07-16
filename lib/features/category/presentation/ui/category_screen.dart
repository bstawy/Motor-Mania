import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/text/text_styles.dart';
import '../../../../../../../core/config/theme/colors_manager.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../../core/widgets/search_bar_widget.dart';
import '../../../../core/widgets/shimmer_loading_widget.dart';
import '../../../home/domain/entities/category_entity.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../logic/category_cubit.dart';
import 'widgets/category_product_item_widget.dart';

class CategoryScreen extends StatelessWidget {
  final HomeCategoryEntity category;
  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
        titleStyle: TextStyles.font14DarkBlueMedium,
        leftPadding: 16.w,
      ),
      body: Column(
        children: [
          Gap(12.h),
          const SearchBarWidget(
            hintText: "What are you looking for?",
            borderColor: ColorsManager.lighterBlue,
          ).setHorizontalPadding(16.w),
          Gap(8.h),
          BlocBuilder<CategoryCubit, CategoryState>(
            bloc: context.read<CategoryCubit>()
              ..getCategoryProducts(category.id),
            builder: (context, state) {
              if (state is CategoryProductsLoading) {
                return _buildCategoryProductsLoading();
              } else if (state is CategoryProductsLoaded) {
                return _buildCategoryProductsLoaded(state.products);
              } else if (state is ErrorState) {
                return Center(
                  child: Text(state.failure.message ?? "")
                      .setHorizontalPadding(16.w),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryProductsLoading() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 0.52.r,
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ShimmerLoadingWidget(
            height: 270.h,
            width: 150.w,
            borderRadius: 15.r,
          );
        },
      ).setHorizontalPadding(16.w),
    );
  }

  Widget _buildCategoryProductsLoaded(List<HomeProductEntity> products) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 0.52.r,
        ),
        padding: EdgeInsets.only(top: 16.h),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CategoryProductItemWidget(product: products[index]);
        },
      ).setHorizontalPadding(16.w),
    );
  }
}
