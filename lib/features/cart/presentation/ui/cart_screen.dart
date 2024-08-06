import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/helpers/extensions/extensions.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () {
          context.read<LayoutCubit>().changeTab(0);
        },
        title: "Cart",
        titleStyle: TextStyles.font14DarkBlueMedium,
        leftPadding: 16.w,
        actions: [
          _buildGoToFavoriteButton(context).setHorizontalPadding(16.w),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CartCubit>().getCartProducts();
        },
        child: BlocBuilder<CartCubit, CartState>(
          bloc: context.read<CartCubit>()..getCartProducts(),
          builder: (context, state) {
            if (state is CartLoading) {
              return const CartProductsLoadingWidget()
                  .setOnlyPadding(12.h, 0, 16.w, 16.w);
            } else if (state is CartLoaded) {
              context.read<LayoutCubit>().openBottomSheet();
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
                    totalPrice: 198.88,
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

  Widget _buildGoToFavoriteButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => context.read<LayoutCubit>().changeTab(1),
      title: "Go To Favorites",
      titleStyle: TextStyles.font10LightGreyRegular,
      iconPath: "assets/icons/favorite_light_icon.svg",
      iconWidth: 17.w,
      iconHeight: 17.h,
      borderRadiusValue: 12.r,
      horizontalPadding: 14.w,
      verticalPadding: 8.h,
    );
  }
}
