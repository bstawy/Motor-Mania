import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';

class CustomFilterChip extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;

  const CustomFilterChip({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: isSelected
            ? ColorsManager.darkkBlue.withOpacity(0.7)
            : Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          SvgPicture.asset(imagePath),
          Gap(2.h),
          Text(
            title,
            style: TextStyles.font10WhiteSemiBold.copyWith(
              color: isSelected ? Colors.white : ColorsManager.darkkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
