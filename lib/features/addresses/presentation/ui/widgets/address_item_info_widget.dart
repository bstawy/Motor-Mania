import 'package:flutter/material.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';

class AddressItemInfoWidget extends StatelessWidget {
  final String title;
  final String data;

  const AddressItemInfoWidget({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: customTextStyles.labelLarge?.copyWith(
              fontWeight: FontWeightHelper.regular,
              color: ColorsManager.blueGrey,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            data,
            style: customTextStyles.labelLarge?.copyWith(
              fontWeight: FontWeightHelper.medium,
            ),
          ),
        ),
      ],
    );
  }
}
