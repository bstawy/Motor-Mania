import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../features/cart/presentation/logic/cart_cubit.dart';
import '../config/text/text_styles.dart';
import '../helpers/extensions/extensions.dart';
import 'custom_material_button.dart';

class CartButtonWidget extends StatelessWidget {
  final dynamic product;

  const CartButtonWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      bloc: context.read<CartCubit>(),
      listenWhen: (previous, current) {
        return current is AddToCartSuccess || current is CartError;
      },
      listener: (BuildContext context, CartState state) {
        if (state is AddToCartSuccess) {
          context.successSnackBar("${product.name} added to your cart");
        } else if (state is CartError) {
          context.errorSnackBar(state.failure.message ?? "An error occurred");
        }
      },
      child: CustomMaterialButton(
        onClicked: () {
          context.read<CartCubit>().addProductToCart(product.id, 1);
        },
        height: 28.h,
        borderRadius: 10.r,
        borderWidth: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/cart_icon.svg",
              width: 16.r,
              height: 16.r,
            ),
            Gap(6.w),
            Text(
              "Add to cart",
              style: TextStyles.font10WhiteMedium,
            ),
          ],
        ),
      ),
    );
  }
}
