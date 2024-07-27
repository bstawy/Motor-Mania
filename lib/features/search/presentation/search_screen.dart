import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/helpers/extensions/extensions.dart';
import '../../../core/widgets/products_grid_item_widget.dart';
import '../../../core/widgets/shimmer_loading_widget.dart';
import '../../favorites/presentation/logic/favorites_cubit.dart';
import '../../home/domain/entities/home_product_entity.dart';
import 'logic/search_cubit.dart';
import 'widgets/app_bar_search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarSearchWidget(),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        bloc: context.read<SearchCubit>(),
        builder: (context, state) {
          if (state is SearchLoading) {
            return _buildCategoryProductsLoading();
          } else if (state is SearchLoaded) {
            return _buildCategoryProductsLoaded(context, state.products);
          } else if (state is SearchEmpty) {
            return Center(
              child: SizedBox(
                width: 260.w,
                height: 260.h,
                child:
                    Lottie.asset('assets/animation/no_data_found_lottie.json'),
              ),
            );
          } else if (state is SearchError) {
            return Center(
              child:
                  Text(state.failure.message ?? "").setHorizontalPadding(16.w),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildCategoryProductsLoading() {
    return GridView.builder(
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
    ).setHorizontalPadding(16.w);
  }

  Widget _buildCategoryProductsLoaded(
      BuildContext context, List<HomeProductEntity> products) {
    List<HomeProductEntity> categoryProducts = products.map(
      (product) {
        return product.copyWith(
          isFavorite:
              context.read<FavoritesCubit>().isFavorite(product.id ?? ""),
        );
      },
    ).toList();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 0.52.r,
      ),
      padding: EdgeInsets.only(top: 16.h),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductsGridItemWidget(product: categoryProducts[index]);
      },
    ).setHorizontalPadding(16.w);
  }
}
