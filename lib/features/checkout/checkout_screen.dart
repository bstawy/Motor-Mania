import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../core/helpers/extensions/navigation_ext.dart';
import '../../core/helpers/extensions/padding_ext.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../cart/presentation/logic/cart_cubit.dart';
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
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        children: [
          const CheckoutAddressWidget(),
          Gap(16.h),
          const CheckoutItemsListWidget(),
          Gap(16.h),
          const CheckoutPaymentMethodsWidget(),
          Gap(16.h),
          const CheckoutOrderSummaryWidget(),
        ],
      ).setOnlyPadding(8.h, 0, 0, 0),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return CheckoutOrderButtonWidget(
              quantity: context.read<CartCubit>().quantity,
              totalPrice: context.read<CartCubit>().subTotal,
            );
          },
        ),
      ),
    );
  }
}
