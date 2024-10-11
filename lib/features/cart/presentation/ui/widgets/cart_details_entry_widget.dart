import 'package:flutter/material.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';

class CartDetailsEntryWidget extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle, valueStyle;

  const CartDetailsEntryWidget({
    super.key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Row(
      children: [
        Text(
          title,
          style: titleStyle ??
              customTextStyles.labelLarge?.copyWith(
                color: ColorsManager.blueGrey,
                fontWeight: FontWeightHelper.regular,
              ),
        ),
        const Spacer(),
        Text(
          value,
          style: valueStyle ??
              customTextStyles.labelLarge?.copyWith(
                fontWeight: FontWeightHelper.regular,
              ),
        ),
      ],
    );
  }
}
