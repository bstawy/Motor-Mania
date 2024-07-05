import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';

class CustomFilterChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CustomFilterChip({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        title,
        style: TextStyles.font10WhiteSemiBold.copyWith(
          color: isSelected ? Colors.white : ColorsManager.darkkBlue,
        ),
      ),
      onSelected: (value) {},
      selected: isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(70.r),
      ),
      selectedColor: ColorsManager.darkkBlue,
      elevation: 0,
      showCheckmark: false,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
    );
  }
}
