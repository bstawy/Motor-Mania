import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../domain/entities/payment_method_entity.dart';
import '../../logic/payment_methods_cubit.dart';

class UserPaymentMethodsListItemWidget extends StatelessWidget {
  final PaymentMethodEntity paymentMethod;

  const UserPaymentMethodsListItemWidget(
      {super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    final PaymentMethodsCubit cubit = context.read<PaymentMethodsCubit>();
    final String iconPath = paymentMethod.cardType.toLowerCase() == "visa"
        ? "assets/icons/visa_logo_icon.svg"
        : "assets/icons/mastercard_logo_icon.svg";

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
          paymentMethod.cardType,
          style: TextStyles.font10DarkBlueMedium,
        ),
        subtitle: Text(
          "*** **** *** ${paymentMethod.lastFourDigits}",
          style: TextStyles.font10BlueGreyRegular,
        ),
        value: paymentMethod.id,
        groupValue: cubit.selectedPaymentMethodId,
        onChanged: (value) {
          cubit.selectPaymentMethod(value!);
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
