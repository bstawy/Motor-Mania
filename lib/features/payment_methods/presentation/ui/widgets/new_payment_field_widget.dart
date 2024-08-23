import 'package:flutter/material.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';

class NewPaymentDataFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final Function(String)? onChanged;

  const NewPaymentDataFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    this.titleStyle,
    this.hintStyle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ?? TextStyles.font10DarkBlueMedium,
        ),
        TextField(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: hintStyle ?? TextStyles.font8DarkBlueRegular,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.blueGrey,
                width: 0.5,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.blueGrey,
                width: 0.5,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.darkBlue,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
