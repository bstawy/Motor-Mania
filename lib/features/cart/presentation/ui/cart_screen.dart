import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../core/helpers/assets_manager.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../logic/cart_cubit.dart';
import 'widgets/cart_checkout_button_widget.dart';
import 'widgets/cart_details_widget.dart';
import 'widgets/cart_empty_widget.dart';
import 'widgets/cart_products_list_widget.dart';
import 'widgets/cart_products_loading_widget.dart';
import 'widgets/coupon_field_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  Widget _buildGoToFavoriteButton(BuildContext context) {
    final customTextStyles = context.textStyles;

    return CustomElevatedButton(
      onPressed: () => context.read<LayoutCubit>().changeTab(1),
      title: "Go To Favorites",
      titleStyle: customTextStyles.labelLarge?.copyWith(
        color: ColorsManager.blueGrey,
        fontWeight: FontWeightHelper.regular,
      ),
      iconPath: AssetsManager.favoriteLightIcon,
      iconWidth: 17.w,
      iconHeight: 17.h,
      borderRadiusValue: 12.r,
      horizontalPadding: 14.w,
      verticalPadding: 8.h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () {
          context.read<LayoutCubit>().changeTab(0);
        },
        title: "Cart",
        actions: [_buildGoToFavoriteButton(context)],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CartCubit>().getCartProducts();
        },
        child: BlocConsumer<CartCubit, CartState>(
          bloc: context.read<CartCubit>()..getCartProducts(),
          listenWhen: (previous, current) {
            return current is CartLoaded ||
                current is CartEmpty ||
                current is CartError;
          },
          listener: (context, state) {
            if (state is CartLoaded) {
              if (context.read<LayoutCubit>().controller.index == 3) {
                context.read<LayoutCubit>().openBottomSheet();
              }
            } else if (state is CartEmpty || state is CartError) {
              if (context.read<LayoutCubit>().controller.index == 3) {
                context.read<LayoutCubit>().closeBottomSheet();
              }
            }
          },
          buildWhen: (previous, current) {
            return current is CartLoading ||
                current is CartLoaded ||
                current is CartEmpty ||
                current is CartError;
          },
          builder: (context, state) {
            if (state is CartLoading) {
              return const CartProductsLoadingWidget()
                  .setOnlyPadding(12.h, 0, 16.w, 16.w);
            } else if (state is CartLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        CartProductsListWidget(
                          cartProducts: state.cartProducts,
                        ),
                        SliverGap(8.h),
                        const SliverToBoxAdapter(
                          child: CouponFieldWidget(),
                        ),
                        SliverGap(16.h),
                        const SliverToBoxAdapter(
                          child: CartDetailsWidget(),
                        ),
                        SliverGap(16.h),
                      ],
                    ).setOnlyPadding(12.h, 0, 16.w, 16.w),
                  ),
                  CartCheckoutButtonWidget(
                    quantity: state.cartProducts.length,
                  ),
                ],
              );
            } else if (state is CartEmpty) {
              return const CartEmptyWidget();
            } else if (state is CartError) {
              return Center(
                child: Text(state.failure.message ?? "")
                    .setHorizontalPadding(16.w),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
