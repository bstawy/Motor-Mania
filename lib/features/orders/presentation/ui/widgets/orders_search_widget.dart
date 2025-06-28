import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class OrdersSearchWidget extends StatelessWidget {
  const OrdersSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return SizedBox(
      height: 32.h,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              enabled: true,
              readOnly: true,
              style: customTextStyles.headlineSmall?.copyWith(
                fontWeight: FontWeightHelper.regular,
              ),
              decoration: InputDecoration(
                hintText: 'Find Items',
                hintStyle: customTextStyles.headlineSmall?.copyWith(
                  color: ColorsManager.blueGrey,
                  fontWeight: FontWeightHelper.regular,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorsManager.blueGrey,
                  size: 16.r,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 11.w,
                ),
                isDense: true,
                fillColor: customColors.inverseSurface,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: ColorsManager.blueGrey,
                    width: 0.75,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: ColorsManager.whiteBlue,
                    width: 0.75,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: ColorsManager.blueGrey,
                    width: 0.75,
                  ),
                ),
              ),
            ),
          ),
          Gap(8.w),
          Expanded(
            child: CustomElevatedButton(
              onPressed: () {},
              title: "Last 7 days",
              titleStyle: customTextStyles.labelLarge?.copyWith(
                color: ColorsManager.blueGrey,
                fontWeight: FontWeightHelper.medium,
              ),
              borderRadiusValue: 12.r,
              backgroundColor: customColors.surface,
              borderColor: ColorsManager.blueGrey,
            ),
          )
        ],
      ),
    );
  }
}
