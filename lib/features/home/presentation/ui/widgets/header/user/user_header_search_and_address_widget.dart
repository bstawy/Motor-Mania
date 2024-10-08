import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:motor_mania/core/helpers/assets_manager.dart';

import '../../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../../../core/widgets/search_bar_widget.dart';

class UserHeaderSearchAndAddressWidget extends StatelessWidget {
  const UserHeaderSearchAndAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Column(
      children: [
        const SearchBarWidget(),
        Gap(8.h),
        Row(
          children: [
            SvgPicture.asset(AssetsManager.locationIcon),
            Gap(6.w),
            Expanded(
              child: Text(
                "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                style: customTextStyles.headlineSmall?.copyWith(
                  color: ColorsManager.blueGrey,
                  fontWeight: FontWeightHelper.medium,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
