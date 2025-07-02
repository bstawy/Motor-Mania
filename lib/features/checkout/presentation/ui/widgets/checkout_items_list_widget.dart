import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/shimmer_loading_widget.dart';
import '../../../../cart/presentation/logic/cart_cubit.dart';
import 'checkout_item_widget.dart';

class CheckoutItemsListWidget extends StatelessWidget {
  const CheckoutItemsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

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
                style: customTextStyles.headlineMedium?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
                children: [
                  TextSpan(
                    text: '(${context.read<CartCubit>().quantity.toString()})',
                    style: customTextStyles.labelLarge?.copyWith(
                      color: ColorsManager.blueGrey,
                      fontWeight: FontWeightHelper.medium,
                    ),
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
                iconPath: AssetsManager.editIcon,
              ),
            ),
          ],
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        BlocBuilder<CartCubit, CartState>(
          bloc: context.read<CartCubit>(),
          builder: (context, state) {
            if (state is CartLoading) {
              return ShimmerLoadingWidget(
                height: 100.h,
                width: 1.sw,
              ).setHorizontalPadding(16.w);
            } else if (state is CartEmpty) {
              return Center(
                child: Text(
                  "Your cart is empty",
                  style: TextStyles.font10BlueGreyRegular,
                ),
              );
            } else {
              return SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  itemCount: context.read<CartCubit>().cartProducts.length,
                  itemBuilder: (context, index) {
                    return CheckoutItemWidget(
                      cartProduct:
                          context.read<CartCubit>().cartProducts[index],
                      isFirst: index == 0,
                      isLast: index ==
                          context.read<CartCubit>().cartProducts.length - 1,
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
