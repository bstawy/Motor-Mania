import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../core/helpers/extensions/theme_ext.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final num? scrollPadding;
  final TextInputAction? action;

  const FormTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    this.isPassword,
    this.validator,
    this.scrollPadding,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: customTextStyles.headlineSmall?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Gap(8.h),
        CustomTextFormField(
          controller: controller,
          hint: hint,
          isPassword: isPassword,
          validator: validator,
          scrollPaddingValue: scrollPadding,
          action: action,
        ),
      ],
    );
  }
}
