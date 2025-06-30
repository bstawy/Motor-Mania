import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../logic/cart_cubit.dart';

class CouponFieldWidget extends StatefulWidget {
  const CouponFieldWidget({super.key});

  @override
  State<CouponFieldWidget> createState() => _CouponFieldWidgetState();
}

class _CouponFieldWidgetState extends State<CouponFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return TextField(
      controller: _controller,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 300.h,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: customColors.inverseSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(
            color: customColors.onTertiary,
            width: 1.w,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 12.h,
        ),
        hintText: "Enter Coupon Code",
        hintStyle: customTextStyles.headlineSmall?.copyWith(
          color: ColorsManager.blueGrey,
          fontWeight: FontWeightHelper.light,
        ),
        suffix: BlocConsumer<CartCubit, CartState>(
          listenWhen: (previous, current) =>
              current is ApplyCouponSuccess || current is ApplyCouponError,
          buildWhen: (previous, current) =>
              current is ApplyCouponSuccess || current is RemoveCoupon,
          listener: (context, state) {
            if (state is ApplyCouponError) {
              context.errorSnackBar(state.error.message);
            }
            FocusScope.of(context).unfocus();
          },
          builder: (context, state) {
            if (state is ApplyCouponSuccess) {
              return InkWell(
                onTap: () {
                  _controller.clear();
                  context.read<CartCubit>().removeCoupon();
                },
                child: Text(
                  "Remove",
                  style: customTextStyles.headlineSmall?.copyWith(
                    color: ColorsManager.red,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              );
            } else {
              return InkWell(
                onTap: () {
                  if (_controller.text.isNotEmpty) {
                    context.read<CartCubit>().applyCoupon(
                        _controller.text, context.read<CartCubit>().subTotal);
                  }
                },
                child: Text(
                  "Apply",
                  style: customTextStyles.headlineSmall?.copyWith(
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
