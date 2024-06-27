import 'package:flutter/material.dart';

import '../../../core/config/text/text_styles.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyles.font14GreyRegular,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyles.font14DarkBlueMedium,
          ),
        ),
      ],
    );
  }
}
