import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/enums/payment_method_types_enum.dart';
import '../../../../../core/helpers/extensions/padding_ext.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../cart/presentation/ui/widgets/cart_details_widget.dart';
import '../../logic/checkout_cubit.dart';

class CheckoutOrderSummaryWidget extends StatelessWidget {
  const CheckoutOrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Summary",
          style: customTextStyles.headlineMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Gap(8.h),
        BlocBuilder<CheckoutCubit, CheckoutState>(
          buildWhen: (previous, current) =>
              current is CheckoutInitial || current is SelectedPaymentMethod,
          builder: (context, state) {
            return CartDetailsWidget(
              cashOnDeliveryFees:
                  context.read<CheckoutCubit>().cashOnDeliveryFees,
              showCashOnDelivery:
                  context.read<CheckoutCubit>().selectedPaymentMethodType ==
                      PaymentMethodTypes.cashOnDelivery,
            );
          },
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
