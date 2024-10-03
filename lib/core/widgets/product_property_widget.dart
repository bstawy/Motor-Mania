import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../main.dart';
import '../config/text/text_styles.dart';
import '../config/theme/colors/colors_manager.dart';

class ProductPropertyWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final TextStyle? titleStyle;

  const ProductPropertyWidget({
    super.key,
    required this.title,
    required this.iconPath,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        Gap(4.w),
        Text(
          title,
          style: titleStyle ??
              TextStyles.font8DarkBlueMedium.copyWith(
                color: themeIsDark ? Colors.white : ColorsManager.darkBlue,
              ),
        ),
      ],
    );
  }
}
