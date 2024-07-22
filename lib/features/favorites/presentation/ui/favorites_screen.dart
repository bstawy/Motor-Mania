import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../core/config/routing/routes.dart';
import '../../../../core/config/text/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../../../../core/widgets/shimmer_loading_widget.dart';
import '../../../category/presentation/ui/widgets/category_product_item_widget.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../logic/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppManagerCubit appManager = context.read<AppManagerCubit>();

    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () {
          context.read<LayoutCubit>().changeTab(0);
        },
        title: "Favorites",
        titleStyle: TextStyles.font14DarkBlueMedium,
        leftPadding: 16.w,
      ),
      body: appManager.isUserLoggedIn
          ? Column(
              children: [
                Gap(12.h),
                const SearchBarWidget(
                  hintText: "What are you looking for?",
                  borderColor: ColorsManager.lighterBlue,
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
                    context
                        .successSnackBar("Product removed from your favorites");
                  },
                  builder: (context, state) {
                    if (state is FavoritesLoading) {
                      return _buildCategoryProductsLoading();
                    } else if (state is FavoritesLoaded) {
                      return _buildCategoryProductsLoaded(state.products);
                    } else if (state is FavoritesEmpty) {
                      return _buildFavoritesEmpty();
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
            )
          : Center(
              child: CustomMaterialButton(
                onClicked: () {
                  context.pushNamed(Routes.loginScreen);
                },
                backgroundColor: ColorsManager.red,
                title: "Login",
              ).setHorizontalPadding(60.w),
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

  Widget _buildFavoritesEmpty() {
    return Column(
      children: [
        Gap(100.h),
        SizedBox(
            width: 260.w,
            height: 260.h,
            child: Lottie.asset('assets/animation/no_data_found_lottie.json')),
      ],
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
