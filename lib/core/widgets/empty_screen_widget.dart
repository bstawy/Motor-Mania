import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../config/text/text_styles.dart';
import '../helpers/extensions/extensions.dart';

class EmptyScreenWidget extends StatelessWidget {
  final String imagePath;
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
    return Column(
      children: [
        Gap(48.h),
        SizedBox(
          width: imageWidth ?? 300.w,
          height: imageHeight ?? 240.h,
          child: Image.asset(imagePath),
        ),
        Gap(24.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: firstTextSpan,
                style: firstTextStyle ?? TextStyles.font24DarkBlueSemiBold,
                children: [
                  TextSpan(
                    text: secondTextSpan,
                    style: secondTextStyle ?? TextStyles.font24RedSemiBold,
                  ),
                  TextSpan(
                    text: thirdTextSpan,
                    style: thirdTextStyle ?? TextStyles.font24DarkBlueSemiBold,
                  ),
                ],
              ),
            ),
            Gap(8.h),
            Text(
              description ?? "",
              style: TextStyles.font12BlueGreyRegular,
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
