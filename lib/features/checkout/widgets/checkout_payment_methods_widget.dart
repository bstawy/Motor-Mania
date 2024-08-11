import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/helpers/extensions/padding_ext.dart';

class CheckoutPaymentMethodsWidget extends StatefulWidget {
  const CheckoutPaymentMethodsWidget({super.key});

  @override
  State<CheckoutPaymentMethodsWidget> createState() =>
      _CheckoutPaymentMethodsWidgetState();
}

class _CheckoutPaymentMethodsWidgetState
    extends State<CheckoutPaymentMethodsWidget> {
  String selectedItem = "Debit/Credit Card";

  void changeItem(String value) {
    setState(() {
      selectedItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Methods",
          style: TextStyles.font14DarkBlueMedium,
        ),
        Gap(8.h),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            children: [
              _buildPaymentItem(
                title: "Debit/Credit Card",
                subTitle: "Add New Card to Your Account",
                iconPath: "assets/icons/card_icon.svg",
              ),
              Gap(16.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                width: double.infinity,
                height: 1.5.h,
                color: ColorsManager.lighterGrey,
              ),
              Gap(16.h),
              _buildPaymentItem(
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
    required String title,
    required String subTitle,
    required String iconPath,
  }) {
    return RadioListTile(
      title: Text(
        title,
        style: TextStyles.font10DarkBlueMedium,
      ),
      subtitle: Text(
        subTitle,
        style: TextStyles.font10BlueGreyRegular,
      ),
      value: title,
      groupValue: selectedItem,
      onChanged: (value) {
        changeItem(value!);
      },
      secondary: SvgPicture.asset(iconPath),
      contentPadding: const EdgeInsets.all(0),
      visualDensity: VisualDensity.compact,
      dense: true,
      activeColor: ColorsManager.darkBlue,
    );
  }
}
