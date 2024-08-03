import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/text/text_styles.dart';
import '../../../../../../../core/config/theme/colors_manager.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../../core/widgets/search_bar_widget.dart';
import '../../../../core/widgets/products_grid_loading_widget.dart';
import '../../../../core/widgets/products_grid_widget.dart';
import '../../../home/domain/entities/category_entity.dart';
import '../logic/category_cubit.dart';

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
            backgroundColor: Colors.white,
            borderColor: ColorsManager.lightBlueGrey,
          ).setHorizontalPadding(16.w),
          Gap(8.h),
          BlocBuilder<CategoryCubit, CategoryState>(
            bloc: context.read<CategoryCubit>()
              ..getCategoryProducts(category.id),
            builder: (context, state) {
              if (state is CategoryProductsLoading) {
                return Expanded(
                    child: const ProductsGridLoadingWidget()
                        .setHorizontalPadding(16.w));
              } else if (state is CategoryProductsLoaded) {
                return Expanded(
                  child: ProductsGridWidget(products: state.products)
                      .setHorizontalPadding(16.w),
                );
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
}
