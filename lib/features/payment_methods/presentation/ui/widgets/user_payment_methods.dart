import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../logic/payment_methods_cubit.dart';
import 'user_payment_methods_list_loading.dart';
import 'user_payment_methods_list_widget.dart';

class UserPaymentMethodsWidget extends StatelessWidget {
  const UserPaymentMethodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentMethodsCubit cubit = context.read<PaymentMethodsCubit>();
    return BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is GetPaymentMethodsLoading ||
          current is GetPaymentMethodsSuccess ||
          current is GetPaymentMethodsFailure,
      builder: (context, state) {
        if (state is GetPaymentMethodsLoading) {
          return const SliverToBoxAdapter(
              child: UserPaymentMethodsListLoadingWidget());
        } else if (state is GetPaymentMethodsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.error.message ?? '',
                style: TextStyles.font10RedRegular,
              ),
            ),
          );
        } else {
          if (cubit.paymentMethods.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "No payment methods available",
                  style: TextStyles.font10BlueGreyRegular,
                ),
              ),
            );
          } else {
            return UserPaymentMethodsListWidget(
                paymentMethods: cubit.paymentMethods);
          }
        }
      },
    );
  }
}
