import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import 'custom_filter_chip_widget.dart';

class CategoriesFilterWidget extends StatefulWidget {
  const CategoriesFilterWidget({super.key});

  @override
  State<CategoriesFilterWidget> createState() => _CategoriesFilterWidgetState();
}

class _CategoriesFilterWidgetState extends State<CategoriesFilterWidget> {
  int selectedCategoryIndex = 0;

  final List<String> categories = [
    "Engine",
    "Brakes",
    "Exterior",
    "Electric",
    "Tyres",
    "Suspension",
    "Interior",
  ];

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
        SizedBox(
          height: 64.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (selectedCategoryIndex != index) {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  }
                },
                child: CustomFilterChip(
                  title: categories[index],
                  imagePath:
                      "assets/icons/category_${categories[index].toLowerCase()}_icon.svg",
                  isSelected: selectedCategoryIndex == index,
                ).setOnlyPadding(0, 0, 8.w, 0),
              );
            },
          ),
        ),
      ],
    );
  }
}
