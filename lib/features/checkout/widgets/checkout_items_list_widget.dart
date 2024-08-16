import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/text_styles.dart';
import '../../../core/helpers/extensions/extensions.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/shimmer_loading_widget.dart';
import '../../cart/presentation/logic/cart_cubit.dart';
import 'checkout_item_widget.dart';

class CheckoutItemsListWidget extends StatelessWidget {
  const CheckoutItemsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Items ',
                style: TextStyles.font14DarkBlueMedium,
                children: [
                  TextSpan(
                    text: '(${context.read<CartCubit>().quantity.toString()})',
                    style: TextStyles.font10BlueGreyMedium,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 23.h,
              child: CustomElevatedButton(
                onPressed: () {
                  context.pop();
                },
                title: "Edit",
                iconPath: "assets/icons/edit_icon.svg",
              ),
            ),
          ],
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        BlocBuilder<CartCubit, CartState>(
          bloc: context.read<CartCubit>(),
          buildWhen: (previous, current) {
            return current is CartLoading ||
                current is CartLoaded ||
                current is CartEmpty ||
                current is CartError;
          },
          builder: (context, state) {
            if (state is CartLoading) {
              return ShimmerLoadingWidget(
                height: 100.h,
                width: 1.sw,
              ).setHorizontalPadding(16.w);
            } else if (state is CartEmpty) {
              return const SizedBox();
            } else if (state is CartLoaded) {
              return SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  itemCount: state.cartProducts.length,
                  itemBuilder: (context, index) {
                    return CheckoutItemWidget(
                      cartProduct: state.cartProducts[index],
                      isFirst: index == 0,
                      isLast: index == state.cartProducts.length - 1,
                    );
                  },
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
