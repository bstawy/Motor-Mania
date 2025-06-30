import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/extensions/extensions.dart';
import '../../../core/widgets/products_grid_loading_widget.dart';
import '../../../core/widgets/products_grid_widget.dart';
import 'logic/search_cubit.dart';
import 'widgets/app_bar_search_widget.dart';
import 'widgets/search_empty_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarSearchWidget(),
        forceMaterialTransparency: true,
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        bloc: context.read<SearchCubit>(),
        builder: (context, state) {
          if (state is SearchLoading) {
            return const ProductsGridLoadingWidget()
                .setHorizontalAndVerticalPadding(16.w, 8.h);
          } else if (state is SearchLoaded) {
            return ProductsGridWidget(products: state.products!)
                .setOnlyPadding(8.h, 0, 16.w, 16.w);
          } else if (state is SearchEmpty) {
            return const SearchEmptyWidget();
          } else if (state is SearchError) {
            return Center(
              child: Text(state.error.message ?? "").setHorizontalPadding(16.w),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
