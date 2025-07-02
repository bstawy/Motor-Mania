import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/enums/payment_method_types_enum.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../logic/checkout_cubit.dart';

class CheckoutPaymentMethodsItemWidget extends StatelessWidget {
  final PaymentMethodTypes type;
  final String title;
  final String subTitle;
  final String iconPath;
  final bool isLoading;

  const CheckoutPaymentMethodsItemWidget({
    super.key,
    required this.type,
    required this.title,
    required this.subTitle,
    required this.iconPath,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    final CheckoutCubit cubit = context.read<CheckoutCubit>();

    return BlocBuilder<CheckoutCubit, CheckoutState>(
      bloc: cubit,
      builder: (context, state) {
        return RadioListTile(
          title: Text(
            title,
            style: customTextStyles.labelLarge?.copyWith(
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          subtitle: isLoading
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Transform.scale(
                      scale: 0.8, child: const CupertinoActivityIndicator()),
                )
              : Text(
                  subTitle,
                  style: customTextStyles.labelLarge?.copyWith(
                    color: ColorsManager.blueGrey,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
          value: type,
          groupValue: cubit.selectedPaymentMethodType,
          onChanged: (value) {
            if (isLoading || value == null) return;
            cubit.selectPaymentMethod(value);
          },
          secondary: SvgPicture.asset(iconPath),
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          dense: true,
          activeColor: customColors.primary,
        );
      },
    );
  }
}
