import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';

class CartItemProductNameAndTypeWidget extends StatelessWidget {
  final String name, type;
  final TextStyle? nameStyle, typeStyle;

  const CartItemProductNameAndTypeWidget({
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
        SizedBox(
          width: 180.w,
          child: Text(
            name,
            style: nameStyle ?? customTextStyles.headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
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
