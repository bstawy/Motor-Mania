import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../models/option_model.dart';

class OptionsListWidget extends StatelessWidget {
  final String title;
  final List<OptionModel> options;

  const OptionsListWidget({
    super.key,
    required this.title,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: customTextStyles.headlineMedium?.copyWith(
            color: customColors.primary,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Gap(8.h),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: customColors.inverseSurface,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: ColorsManager.blueGrey,
                  indent: 16.w,
                  endIndent: 16.w,
                );
              },
              itemCount: options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (options[index].onTap != null) {
                      options[index].onTap!(context);
                    }
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                      context.themeIsDark
                          ? options[index].leadingDarkIconPath!
                          : options[index].leadingIconPath!,
                    ),
                    title: Text(
                      options[index].title!,
                      style: customTextStyles.headlineSmall?.copyWith(
                        color: customColors.primary,
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.r,
                      color: ColorsManager.blueGrey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
