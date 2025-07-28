import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions/padding_ext.dart';
import '../../../../../core/widgets/products_list_loading_widget.dart';
import '../../../../../core/widgets/products_list_widget.dart';
import '../../logic/home_cubit/home_cubit.dart';

class RecommendedProductsListWidget extends StatelessWidget {
  const RecommendedProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>(),
      buildWhen: (previous, current) {
        return current is RecommendedProductsLoading ||
            current is RecommendedProductsLoaded ||
            current is RecommendedProductsError;
      },
      builder: (context, state) {
        if (state is RecommendedProductsLoading) {
          return const ProductsListLoadingWidget();
        } else if (state is RecommendedProductsLoaded) {
          return ProductsListWidget(
            title: "Recommended For You",
            products: state.recommendedProducts ?? [],
          );
        } else if (state is RecommendedProductsError) {
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
