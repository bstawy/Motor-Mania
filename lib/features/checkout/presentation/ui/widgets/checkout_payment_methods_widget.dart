import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/enums/payment_method_types_enum.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../payment_methods/domain/entities/payment_method_entity.dart';
import '../../../../payment_methods/presentation/logic/payment_methods_cubit.dart';
import 'checkout_payment_methods_item_widget.dart';

class CheckoutPaymentMethodsWidget extends StatelessWidget {
  const CheckoutPaymentMethodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment Methods",
              style: customTextStyles.headlineMedium?.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(
              height: 23.h,
              child: CustomElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.paymentMethods);
                },
                title: "Edit",
                iconPath: AssetsManager.editIcon,
              ),
            ),
          ],
        ),
        Gap(8.h),
        Container(
          padding: EdgeInsets.only(
            top: 8.h,
            bottom: 8.h,
            left: 8.w,
            right: 16.w,
          ),
          decoration: BoxDecoration(
            color: customColors.inverseSurface,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            children: [
              // TODO: use dark icons
              BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
                buildWhen: (previous, current) {
                  return current is GetWalletBalanceLoading ||
                      current is GetWalletBalanceSuccess ||
                      current is GetWalletBalanceFailure;
                },
                builder: (context, state) {
                  bool isLoading = state is GetWalletBalanceLoading;
                  bool isFailure = state is GetWalletBalanceFailure;
                  num walletBalance =
                      state is GetWalletBalanceSuccess ? state.balance : 0;

                  return CheckoutPaymentMethodsItemWidget(
                    type: PaymentMethodTypes.wallet,
                    title: PaymentMethodTypes.wallet.name,
                    subTitle: isFailure
                        ? "Error loading balance"
                        : "Available: \$$walletBalance",
                    iconPath: "assets/icons/wallet_icon.svg",
                    isLoading: isLoading,
                  );
                },
              ),
              Gap(8.h),
              Container(
                margin: EdgeInsets.only(left: 8.w),
                width: double.infinity,
                height: 0.75.h,
                color: ColorsManager.blueGrey,
              ),
              Gap(8.h),
              BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
                buildWhen: (previous, current) {
                  return current is GetPaymentMethodsLoading ||
                      current is GetPaymentMethodsSuccess ||
                      current is GetPaymentMethodsFailure;
                },
                builder: (context, state) {
                  bool isLoading = state is GetPaymentMethodsLoading;
                  PaymentMethodEntity? defaultPaymentMethod =
                      state is GetPaymentMethodsSuccess
                          ? state.paymentMethods?.firstWhere((e) => e.isDefault)
                          : null;

                  return CheckoutPaymentMethodsItemWidget(
                    type: PaymentMethodTypes.debitOrCreditCard,
                    title: PaymentMethodTypes.debitOrCreditCard.name,
                    subTitle: defaultPaymentMethod != null
                        ? "*** **** *** ${defaultPaymentMethod.lastFourDigits}"
                        : "Add New Card to Your Account",
                    iconPath: "assets/icons/card_icon.svg",
                    isLoading: isLoading,
                  );
                },
              ),
              Gap(8.h),
              Container(
                margin: EdgeInsets.only(left: 8.w),
                width: double.infinity,
                height: 0.75.h,
                color: ColorsManager.blueGrey,
              ),
              Gap(8.h),
              CheckoutPaymentMethodsItemWidget(
                type: PaymentMethodTypes.cashOnDelivery,
                title: PaymentMethodTypes.cashOnDelivery.name,
                subTitle: "Extra Charges May Be Applied",
                iconPath: "assets/icons/cash_icon.svg",
                isLoading: false,
              ),
            ],
          ),
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
