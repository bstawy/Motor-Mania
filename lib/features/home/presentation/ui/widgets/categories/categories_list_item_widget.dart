import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/config/text/text_styles.dart';
import '../../../../domain/entities/category_entity.dart';

class CategoriesListItem extends StatelessWidget {
  final Category category;

  const CategoriesListItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: 70.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          SvgPicture.network(
            category.imageUrl,
            width: 24.w,
            height: 24.h,
          ),
          Gap(2.h),
          Text(
            category.name,
            style: TextStyles.font10DarkBlueMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
