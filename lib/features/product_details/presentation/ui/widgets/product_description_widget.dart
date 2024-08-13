import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final String description;

  const ProductDescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Product Details",
          style: TextStyles.font14DarkBlueSemiBold,
        ),
        Gap(8.h),
        Text(
          description,
          style: TextStyles.font12DarkBlueRegular,
        ),
      ],
    );
  }
}
