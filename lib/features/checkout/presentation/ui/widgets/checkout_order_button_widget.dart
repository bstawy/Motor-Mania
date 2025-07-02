import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/text/text_styles.dart';
import '../../../../../../../core/widgets/custom_material_button.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/helpers/enums/payment_method_types_enum.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../cart/presentation/logic/cart_cubit.dart';
import '../../../../payment_methods/presentation/logic/payment_methods_cubit.dart';
import '../../logic/checkout_cubit.dart';
import 'checkout_order_success_sheet_widget.dart';

class CheckoutOrderButtonWidget extends StatelessWidget {
  final int quantity;
  final num totalPrice;

  const CheckoutOrderButtonWidget({
    super.key,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;

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
      child: Column(
        children: [
          BlocConsumer<CheckoutCubit, CheckoutState>(
            bloc: context.read<CheckoutCubit>(),
            listenWhen: (previous, current) =>
                current is MakeOrderLoading ||
                current is MakeOrderSuccess ||
                current is MakeOrderFailure,
            listener: (context, state) {
              if (state is MakeOrderSuccess) {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const CheckoutOrderSuccessSheet(),
                  isScrollControlled: true,
                  useSafeArea: true,
                  backgroundColor: customColors.inverseSurface,
                );
              } else if (state is MakeOrderFailure) {
                context.errorSnackBar(state.error.message);
              }
            },
            builder: (context, state) {
              final bool isLoading = state is MakeOrderLoading;

              return GestureDetector(
                child: CustomMaterialButton(
                  onClicked: () async {
                    final String selectedPaymentMethodId = context
                        .read<PaymentMethodsCubit>()
                        .selectedPaymentMethodId;

                    await context.read<CheckoutCubit>().makeOrder(
                          paymentMethodId: context
                                      .read<CheckoutCubit>()
                                      .selectedPaymentMethodType ==
                                  PaymentMethodTypes.debitOrCreditCard
                              ? int.tryParse(selectedPaymentMethodId)
                              : null,
                          shippingAddress: "123 Example Street",
                          couponCode:
                              context.read<CartCubit>().couponData?.couponCode,
                        );
                  },
                  height: 40.h,
                  loading: isLoading,
                  backgroundColor: ColorsManager.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CLICK TO ORDER",
                        style: TextStyles.font12WhiteSemiBold,
                      ),
                      SvgPicture.asset("assets/icons/checkout_icon.svg"),
                    ],
                  ),
                ),
              );
            },
          ),
          Gap(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$quantity items",
                style: TextStyles.font12BlueGreySemiBold,
              ),
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: TextStyles.font16WhiteSemiBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
