import 'package:flutter/material.dart';

import '../../../../../core/config/text/text_styles.dart';

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
    return Row(
      children: [
        Text(
          title,
          style: titleStyle ?? TextStyles.font10BlueGreyRegular,
        ),
        const Spacer(),
        Text(
          value,
          style: valueStyle ?? TextStyles.font10DarkBlueRegular,
        ),
      ],
    );
  }
}
