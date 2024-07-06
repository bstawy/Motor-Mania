import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import 'category_item_model.dart';

class CategoriesListItem extends StatelessWidget {
  final CategoryItemModel category;

  const CategoriesListItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          SvgPicture.asset(category.imageUrl),
          Gap(2.h),
          Text(
            category.title,
            style: TextStyles.font10DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
