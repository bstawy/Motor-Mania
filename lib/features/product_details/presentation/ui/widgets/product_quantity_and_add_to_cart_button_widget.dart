import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:popover/popover.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../../core/widgets/quantity_pop_up_widget.dart';
import '../../../../cart/presentation/logic/cart_cubit.dart';
import '../../../domain/entities/product_entity.dart';
import '../../logic/product_cubit.dart';

class ProductQuantityAndAddToCartButtonWidget extends StatelessWidget {
  final ProductCubit productCubit;
  const ProductQuantityAndAddToCartButtonWidget({
    super.key,
    required this.productCubit,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 4.h,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.darkBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showPopover(
                context: context,
                bodyBuilder: (context) => BlocProvider.value(
                  value: productCubit,
                  child: const QuantityPopUpWidget(),
                ),
                direction: PopoverDirection.bottom,
                height: 50.h,
                width: 177.w,
                radius: 12.r,
                arrowDxOffset: -150.w,
                arrowWidth: 0,
              );
            },
            child: Container(
              width: 40.r,
              height: 40.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 9.w),
              decoration: BoxDecoration(
                color: customColors.surface,
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "QTY",
                    style: customTextStyles.labelMedium?.copyWith(
                      color: ColorsManager.blueGrey,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  BlocBuilder<ProductCubit, ProductState>(
                    bloc: context.read<ProductCubit>(),
                    buildWhen: (previous, current) =>
                        current is ProductQuantityUpdated,
                    builder: (context, state) {
                      if (state is ProductQuantityUpdated) {
                        return Text(
                          state.quantity.toString(),
                          style: customTextStyles.headlineMedium?.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        );
                      } else {
                        return Text(
                          "1",
                          style: customTextStyles.headlineMedium?.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Gap(8.w),
          Expanded(
            child: CustomMaterialButton(
              onClicked: () {
                ProductEntity product = context.read<ProductCubit>().product;
                int quantity = context.read<ProductCubit>().productQuantity;

                context
                    .read<CartCubit>()
                    .addProductToCart(product.id!, quantity);
              },
              height: 40.h,
              backgroundColor: ColorsManager.red,
              title: "ADD TO CART",
            ),
          ),
        ],
      ),
    );
  }
}
