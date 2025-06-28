import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../config/app_manager/app_manager_cubit.dart';
import '../config/theme/colors/colors_manager.dart';
import '../config/theme/texts/font_weight_helper.dart';
import '../helpers/extensions/extensions.dart';
import '../helpers/extensions/theme_ext.dart';

class EmptyScreenWidget extends StatelessWidget {
  final String imagePath;
  final String? darkImagePath;
  final String? firstTextSpan;
  final String? secondTextSpan;
  final String? thirdTextSpan;
  final String? description;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;
  final TextStyle? thirdTextStyle;
  final TextStyle? descriptionStyle;
  final double? imageWidth;
  final double? imageHeight;
  final double? topPadding;
  final double? bottomPadding;
  final double? leftPadding;
  final double? rightPadding;

  const EmptyScreenWidget({
    super.key,
    required this.imagePath,
    this.darkImagePath,
    this.firstTextSpan,
    this.secondTextSpan,
    this.thirdTextSpan,
    this.description,
    this.firstTextStyle,
    this.secondTextStyle,
    this.thirdTextStyle,
    this.descriptionStyle,
    this.imageWidth,
    this.imageHeight,
    this.topPadding,
    this.bottomPadding,
    this.leftPadding,
    this.rightPadding,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Column(
      children: [
        Gap(48.h),
        BlocBuilder<AppManagerCubit, AppManagerState>(
          bloc: context.read<AppManagerCubit>(),
          builder: (context, state) {
            return SizedBox(
              width: imageWidth ?? 300.w,
              height: imageHeight ?? 240.h,
              child: Image.asset(
                darkImagePath != null && context.themeIsDark
                    ? darkImagePath!
                    : imagePath,
              ),
            );
          },
        ),
        Gap(24.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: firstTextSpan,
                style: customTextStyles.displayMedium?.copyWith(
                  fontWeight: FontWeightHelper.semiBold,
                ),
                //firstTextStyle ?? TextStyles.font24DarkBlueSemiBold,
                children: [
                  TextSpan(
                    text: secondTextSpan,
                    style: customTextStyles.displayMedium?.copyWith(
                      color: ColorsManager.red,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                    // secondTextStyle ?? TextStyles.font24RedSemiBold,
                  ),
                  TextSpan(
                    text: thirdTextSpan,
                    style: customTextStyles.displayMedium?.copyWith(
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(8.h),
            Text(
              description ?? "",
              style: customTextStyles.headlineSmall?.copyWith(
                color: ColorsManager.blueGrey,
                fontWeight: FontWeightHelper.regular,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ).setOnlyPadding(
          topPadding ?? 0,
          bottomPadding ?? 0,
          rightPadding ?? 60.w,
          leftPadding ?? 60.w,
        ),
      ],
    );
  }
}
