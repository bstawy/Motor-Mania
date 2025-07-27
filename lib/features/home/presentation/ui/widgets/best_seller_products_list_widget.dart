import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/products_list_loading_widget.dart';
import '../../../../../core/widgets/products_list_widget.dart';
import '../../logic/home_cubit/home_cubit.dart';

class BestSellerProductsListWidget extends StatelessWidget {
  const BestSellerProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>(),
      buildWhen: (previous, current) {
        return current is BestSellerProductsLoading ||
            current is BestSellerProductsLoaded ||
            current is BestSellerProductsError;
      },
      builder: (context, state) {
        if (state is BestSellerProductsLoading) {
          return const ProductsListLoadingWidget();
        } else if (state is BestSellerProductsLoaded) {
          return ProductsListWidget(
            title: "BestSellers",
            products: state.bestSellerProducts ?? [],
          );
        } else if (state is BestSellerProductsError) {
          return Center(
            child: Text(state.error.message ?? "").setHorizontalPadding(16.w),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
