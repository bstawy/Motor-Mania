import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/enums/payment_method_types_enum.dart';
import '../../../../core/helpers/extensions/navigation_ext.dart';
import '../../../../core/helpers/extensions/padding_ext.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../cart/presentation/logic/cart_cubit.dart';
import '../logic/checkout_cubit.dart';
import 'widgets/checkout_address_widget.dart';
import 'widgets/checkout_items_list_widget.dart';
import 'widgets/checkout_order_button_widget.dart';
import 'widgets/checkout_order_summary_widget.dart';
import 'widgets/checkout_payment_methods_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () {
          context.pop();
        },
        title: "Checkout",
      ),
      body: CustomScrollView(
        slivers: [
          SliverGap(16.h),
          const SliverToBoxAdapter(
            child: CheckoutAddressWidget(),
          ),
          SliverGap(16.h),
          const SliverToBoxAdapter(
            child: CheckoutItemsListWidget(),
          ),
          SliverGap(16.h),
          const SliverToBoxAdapter(
            child: CheckoutPaymentMethodsWidget(),
          ),
          SliverGap(16.h),
          const SliverToBoxAdapter(
            child: CheckoutOrderSummaryWidget(),
          ),
          SliverGap(16.h),
        ],
      ).setOnlyPadding(8.h, 0, 0, 0),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: BlocBuilder<CheckoutCubit, CheckoutState>(
          bloc: context.read<CheckoutCubit>(),
          builder: (context, state) {
            num total = context.read<CartCubit>().total;
            if (context.read<CheckoutCubit>().selectedPaymentMethodType ==
                PaymentMethodTypes.cashOnDelivery) {
              total += context.read<CheckoutCubit>().cashOnDeliveryFees;
            }
            int quantity = context.read<CartCubit>().quantity;

            return CheckoutOrderButtonWidget(
              quantity: quantity,
              totalPrice: total,
            );
          },
        ),
      ),
    );
  }
}
