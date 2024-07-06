import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/config/text/text_styles.dart';
import '../../../../../../core/helpers/extensions/extensions.dart';
import 'categories_list_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: TextStyles.font14DarkBlueSemiBold,
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        const CategoriesList(),
      ],
    );
  }
}
