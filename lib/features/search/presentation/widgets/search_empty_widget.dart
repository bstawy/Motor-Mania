import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/config/theme/texts/font_weight_helper.dart';

class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Gap(40.h),
        SizedBox(
          width: 300.w,
          height: 240.h,
          child: Image.asset("assets/images/search_empty_image.png"),
        ),
        Gap(24.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'No Search ',
                style: TextStyles.font24DarkBlueBold
                    .copyWith(fontWeight: FontWeightHelper.semiBold),
                children: [
                  TextSpan(
                    text: 'Results!',
                    style: TextStyles.font24DarkBlueBold.copyWith(
                      fontWeight: FontWeightHelper.semiBold,
                      color: ColorsManager.red,
                    ),
                  ),
                ],
              ),
            ),
            Gap(8.h),
            Text(
              'Try Search For Another Product.',
              style: TextStyles.font12DarkBlueRegular.copyWith(
                color: ColorsManager.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ).setHorizontalPadding(60.w),
      ],
    );
  }
}
