import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import 'custom_filter_chip_widget.dart';

class CategoriesFilterWidget extends StatelessWidget {
  CategoriesFilterWidget({super.key});

  final List<String> categories = [
    "Mechanic",
    "Electrician",
    "Plumber",
    "Carpenter",
    "Painter",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: TextStyles.font20DarkBlueBold,
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomFilterChip(
                title: categories[index],
                isSelected: index == 0,
              ).setOnlyPadding(0, 0, 4.w, 0);
            },
          ),
        ),
      ],
    );
  }
}
