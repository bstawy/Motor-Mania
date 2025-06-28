import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../config/theme/texts/font_weight_helper.dart';
import '../helpers/extensions/theme_ext.dart';

class ProductPropertyWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final TextStyle? titleStyle;

  const ProductPropertyWidget({
    super.key,
    required this.title,
    required this.iconPath,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Row(
      children: [
        SvgPicture.asset(iconPath),
        Gap(4.w),
        Text(
          title,
          style: titleStyle ??
              customTextStyles.labelMedium?.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
        ),
      ],
    );
  }
}
