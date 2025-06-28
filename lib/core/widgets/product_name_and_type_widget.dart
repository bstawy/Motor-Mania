import 'package:flutter/material.dart';

import '../config/theme/texts/font_weight_helper.dart';
import '../helpers/extensions/theme_ext.dart';

class ProductNameAndTypeWidget extends StatelessWidget {
  final String name, type;
  final TextStyle? nameStyle, typeStyle;

  const ProductNameAndTypeWidget({
    super.key,
    required this.name,
    required this.type,
    this.nameStyle,
    this.typeStyle,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: nameStyle ?? customTextStyles.headlineMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          type,
          style: typeStyle ??
              customTextStyles.labelLarge?.copyWith(
                fontWeight: FontWeightHelper.regular,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
