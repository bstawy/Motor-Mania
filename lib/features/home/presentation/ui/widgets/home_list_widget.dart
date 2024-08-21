import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/products_list_loading_widget.dart';
import '../../../../../core/widgets/products_list_widget.dart';
import '../../logic/home_cubit/home_cubit.dart';

class HomeListWidget extends StatelessWidget {
  final String title;

  const HomeListWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>()..getHomeProducts(),
      buildWhen: (previous, current) {
        return current is ProductsLoading ||
            current is ProductsLoaded ||
            current is ProductsError;
      },
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const ProductsListLoadingWidget();
        } else if (state is ProductsLoaded) {
          return ProductsListWidget(
            title: title,
            products: state.products,
          );
        } else if (state is ProductsError) {
          return Center(
            child: Text(state.failure.message ?? "").setHorizontalPadding(16.w),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
