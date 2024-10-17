import 'package:flutter/material.dart';

import '../../../core/config/theme/colors/colors_manager.dart';
import '../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../core/helpers/extensions/theme_ext.dart';

class CustomAccountWidget extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomAccountWidget({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: customTextStyles.headlineSmall?.copyWith(
            color: ColorsManager.blueGrey,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: customTextStyles.headlineSmall?.copyWith(
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
