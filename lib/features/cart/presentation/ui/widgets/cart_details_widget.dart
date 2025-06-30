import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/snackbar_ext.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../logic/cart_cubit.dart';
import 'cart_details_entry_widget.dart';

class CartDetailsWidget extends StatelessWidget {
  const CartDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: customColors.inverseSurface,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: BlocConsumer<CartCubit, CartState>(
        bloc: context.read<CartCubit>(),
        listenWhen: (previous, current) {
          if (current is CartLoaded ||
              current is ApplyCouponSuccess ||
              current is RemoveCoupon) {
            return true;
          }
          return false;
        },
        buildWhen: (previous, current) {
          if (current is ApplyCouponLoading ||
              current is CartLoaded ||
              current is ApplyCouponSuccess ||
              current is RemoveCoupon) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if (state is ApplyCouponLoading) {
            context.loadingSnackBar("Applying Coupon...");
          } else if (state is ApplyCouponSuccess) {
            context.successSnackBar("Coupon Applied Successfully");
          } else if (state is RemoveCoupon) {
            context.successSnackBar("Coupon Removed Successfully");
          } else if (state is ApplyCouponError) {
            context.errorSnackBar(state.error.message);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              CartDetailsEntryWidget(
                title: "Subtotal",
                value:
                    "\$${context.read<CartCubit>().subTotal.toStringAsFixed(2)}",
              ),
              Gap(4.h),
              CartDetailsEntryWidget(
                title: "Shipping Fees",
                value: context.read<CartCubit>().shippingFees == 0.0
                    ? "Free"
                    : "\$${context.read<CartCubit>().shippingFees.toStringAsFixed(2)}",
                valueStyle: customTextStyles.labelLarge?.copyWith(
                  color: ColorsManager.red,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              Gap(4.h),
              CartDetailsEntryWidget(
                title: "Discount",
                value:
                    "-\$${context.read<CartCubit>().discount.toStringAsFixed(2)}",
                titleStyle: customTextStyles.labelLarge?.copyWith(
                  color: ColorsManager.red,
                  fontWeight: FontWeightHelper.semiBold,
                ),
                valueStyle: customTextStyles.labelLarge?.copyWith(
                  color: ColorsManager.red,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              Gap(8.h),
              Visibility(
                visible: state is ApplyCouponSuccess,
                replacement: const SizedBox.shrink(),
                maintainState: true,
                child: Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsManager.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.couponIcon,
                      ),
                      Gap(4.w),
                      Text(
                        "Hurry! You Got a Discount",
                        style: customTextStyles.labelMedium?.copyWith(
                          color: ColorsManager.red,
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(4.h),
              Divider(
                color: ColorsManager.blueGrey,
                thickness: 1.h,
              ),
              Gap(4.h),
              Row(
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Total ',
                      style: customTextStyles.headlineLarge,
                      children: [
                        TextSpan(
                          text: '(Incl. VAT)',
                          style: customTextStyles.labelMedium?.copyWith(
                            color: ColorsManager.blueGrey,
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "\$${context.read<CartCubit>().total.toStringAsFixed(2)}",
                    style: customTextStyles.headlineLarge,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
