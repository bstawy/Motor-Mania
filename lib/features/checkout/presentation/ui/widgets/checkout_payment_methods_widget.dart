import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class CheckoutPaymentMethodsWidget extends StatefulWidget {
  const CheckoutPaymentMethodsWidget({super.key});

  @override
  State<CheckoutPaymentMethodsWidget> createState() =>
      _CheckoutPaymentMethodsWidgetState();
}

class _CheckoutPaymentMethodsWidgetState
    extends State<CheckoutPaymentMethodsWidget> {
  String selectedItem = "0";

  void changeItem(String value) {
    setState(() {
      selectedItem = value;
    });
  }

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
              _buildPaymentItem(
                index: 0,
                title: "My Wallet",
                subTitle: "Available: \$1,925.25",
                iconPath: "assets/icons/wallet_icon.svg",
              ),
              Gap(8.h),
              Container(
                margin: EdgeInsets.only(left: 8.w),
                width: double.infinity,
                height: 0.75.h,
                color: ColorsManager.blueGrey,
              ),
              Gap(8.h),
              _buildPaymentItem(
                index: 1,
                title: "Debit/Credit Card",
                subTitle: "Add New Card to Your Account",
                iconPath: "assets/icons/card_icon.svg",
              ),
              Gap(8.h),
              Container(
                margin: EdgeInsets.only(left: 8.w),
                width: double.infinity,
                height: 0.75.h,
                color: ColorsManager.blueGrey,
              ),
              Gap(8.h),
              _buildPaymentItem(
                index: 2,
                title: "Cash On Delivery",
                subTitle: "Extra Charges May Be Applied",
                iconPath: "assets/icons/cash_icon.svg",
              ),
            ],
          ),
        ),
      ],
    ).setHorizontalPadding(16.w);
  }

  Widget _buildPaymentItem({
    required int index,
    required String title,
    required String subTitle,
    required String iconPath,
  }) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return RadioListTile(
      title: Text(
        title,
        style: customTextStyles.labelLarge?.copyWith(
          fontWeight: FontWeightHelper.medium,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: customTextStyles.labelLarge?.copyWith(
          color: ColorsManager.blueGrey,
          fontWeight: FontWeightHelper.regular,
        ),
      ),
      value: index.toString(),
      groupValue: selectedItem,
      onChanged: (value) {
        changeItem(value!);
      },
      secondary: SvgPicture.asset(iconPath),
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      dense: true,
      activeColor: customColors.primary,
    );
  }
}
