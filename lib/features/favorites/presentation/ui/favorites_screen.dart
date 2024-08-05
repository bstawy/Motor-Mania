import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/products_grid_loading_widget.dart';
import '../../../../core/widgets/products_grid_widget.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../logic/favorites_cubit.dart';
import 'widgets/favorites_empty_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () {
          context.read<LayoutCubit>().changeTab(0);
        },
        title: "Favorites",
        titleStyle: TextStyles.font14DarkBlueMedium,
        leftPadding: 16.w,
      ),
      body: Column(
        children: [
          Gap(12.h),
          const SearchBarWidget(
            backgroundColor: Colors.white,
            borderColor: ColorsManager.blueGrey,
          ).setHorizontalPadding(16.w),
          Gap(8.h),
          BlocConsumer<FavoritesCubit, FavoritesState>(
            bloc: context.read<FavoritesCubit>()..getAllFavorites(),
            listenWhen: (previous, current) {
              if (current is RemoveFromFavoritesSuccess) {
                return true;
              }
              return false;
            },
            listener: (context, state) {
              context.successSnackBar("Product removed from your favorites");
            },
            builder: (context, state) {
              if (state is FavoritesLoading) {
                return Expanded(
                  child: const ProductsGridLoadingWidget()
                      .setHorizontalPadding(16.w),
                );
              } else if (state is FavoritesLoaded) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () =>
                        context.read<FavoritesCubit>().getAllFavorites(),
                    child: ProductsGridWidget(products: state.products)
                        .setHorizontalPadding(16.w),
                  ),
                );
              } else if (state is FavoritesEmpty) {
                return const Expanded(child: FavoritesEmptyWidget());
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
