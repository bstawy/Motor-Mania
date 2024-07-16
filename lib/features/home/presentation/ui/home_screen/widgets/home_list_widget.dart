import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../domain/entities/home_product_entity.dart';
import '../../../logic/home_cubit.dart';
import 'home_list_item_widget.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        bloc: context.read<HomeCubit>()..getHomeProducts(),
        buildWhen: (previous, current) {
          if (current is ProductsLoading ||
              current is ProductsLoaded ||
              current is ProductsErrorState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is ProductsLoading) {
            return _buildProductsLoading();
          } else if (state is ProductsLoaded) {
            return _buildProductsList(state.products);
          } else if (state is ProductsErrorState) {
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
    return SizedBox(
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
    );
  }

  SizedBox _buildProductsList(List<HomeProductEntity> products) {
    return SizedBox(
      height: 295.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return HomeListItem(product: products[index])
              .setOnlyPadding(0, 0, 8.w, 0);
        },
      ),
    );
  }
}
