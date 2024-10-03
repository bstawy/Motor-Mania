import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/text_styles.dart';
import '../../../core/config/theme/colors/colors_manager.dart';

class PasswordValidations extends StatelessWidget {
  final bool isPasswordEmpty;
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.isPasswordEmpty,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        const Gap(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        const Gap(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        const Gap(2),
        buildValidationRow('At least 1 number', hasNumber),
        const Gap(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: hasValidated ? Colors.green : ColorsManager.red,
          ),
          child: Icon(
            hasValidated ? Icons.check : Icons.close,
            color: Colors.white,
            size: 8,
          ),
        ),
        const Gap(6),
        Text(
          text,
          style: TextStyles.font12DarkBlueRegular,
        )
      ],
    );
  }
}
