import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';

class UserPaymentMethodsWidget extends StatefulWidget {
  const UserPaymentMethodsWidget({super.key});

  @override
  State<UserPaymentMethodsWidget> createState() =>
      _UserPaymentMethodsWidgetState();
}

class _UserPaymentMethodsWidgetState extends State<UserPaymentMethodsWidget> {
  final List<(String, String, String)> paymentMethods = [
    ("Visa", "*** **** *** 9115", "assets/icons/mastercard_logo_icon.svg"),
    ("MasterCard", "*** **** *** 9115", "assets/icons/visa_logo_icon.svg"),
  ];

  String selectedItem = "0";

  void changeItem(String value) {
    setState(() {
      selectedItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: paymentMethods.length,
      separatorBuilder: (context, index) => Gap(8.h),
      itemBuilder: (context, index) {
        return _buildPaymentItem(
          index: index,
          title: paymentMethods[index].$1,
          subTitle: paymentMethods[index].$2,
          iconPath: paymentMethods[index].$3,
        );
      },
    );
  }

  Widget _buildPaymentItem({
    required int index,
    required String title,
    required String subTitle,
    required String iconPath,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: 8.h,
        bottom: 8.h,
        left: 16.w,
        right: 8.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: RadioListTile(
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(
          title,
          style: TextStyles.font10DarkBlueMedium,
        ),
        subtitle: Text(
          subTitle,
          style: TextStyles.font10BlueGreyRegular,
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
        activeColor: ColorsManager.darkBlue,
      ),
    );
  }
}
