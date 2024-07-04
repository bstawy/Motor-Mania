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
        "Mechanic",
        style: TextStyles.font10WhiteSemiBold,
      ),
      onSelected: (vakye) {},
      selected: true,
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
