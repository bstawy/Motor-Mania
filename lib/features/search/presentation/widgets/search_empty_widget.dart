import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../core/helpers/assets_manager.dart';
import '../../../../core/helpers/extensions/theme_ext.dart';

class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Gap(40.h),
        SizedBox(
          width: 300.w,
          height: 240.h,
          child: Image.asset(
            context.read<AppManagerCubit>().currentThemeMode == ThemeMode.dark
                ? AssetsManager.searchEmptyDarkImage
                : AssetsManager.searchEmptyImage,
          ),
        ),
        Gap(24.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'No Search ',
                style: customTextStyles.displayMedium?.copyWith(
                  fontWeight: FontWeightHelper.semiBold,
                ),
                children: [
                  TextSpan(
                    text: 'Results!',
                    style: customTextStyles.displayMedium?.copyWith(
                      color: ColorsManager.red,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(8.h),
            Text(
              'Try Search For Another Product.',
              style: customTextStyles.headlineSmall?.copyWith(
                color: ColorsManager.blueGrey,
                fontWeight: FontWeightHelper.regular,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ).setHorizontalPadding(60.w),
      ],
    );
  }
}
