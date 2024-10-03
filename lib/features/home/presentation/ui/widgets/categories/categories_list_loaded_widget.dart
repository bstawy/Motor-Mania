import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../motor_mania_app.dart';
import '../../../../domain/entities/category_entity.dart';
import 'categories_list_item_widget.dart';

class CategoriesListLoadedWidget extends StatelessWidget {
  final List<HomeCategoryEntity> categories;

  const CategoriesListLoadedWidget({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: customTextStyles.titleLarge,
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        SizedBox(
          height: 75.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => Gap(8.w),
            itemBuilder: (context, index) {
              return CategoriesListItem(
                category: categories[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
