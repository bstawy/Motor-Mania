import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final String description;

  const ProductDescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Product Details",
          style: customTextStyles.headlineMedium?.copyWith(
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        Gap(8.h),
        Text(
          description,
          style: customTextStyles.headlineMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }
}
