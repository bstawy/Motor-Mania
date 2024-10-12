import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../main.dart';
import '../../../models/option_model.dart';
import '../../logic/profile_cubit.dart';

class OptionsGridWidget extends StatelessWidget {
  const OptionsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    final List<OptionModel> options =
        context.read<ProfileCubit>().primaryOptions;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        mainAxisExtent: 60.h,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (options[index].onTap != null) {
              options[index].onTap!(context);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: customColors.inverseSurface,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  themeIsDark
                      ? options[index].leadingDarkIconPath!
                      : options[index].leadingIconPath!,
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(9.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      options[index].title!,
                      style: customTextStyles.headlineSmall?.copyWith(
                        color: customColors.primary,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                    Text(
                      options[index].subtitle!,
                      style: customTextStyles.labelLarge?.copyWith(
                        color: ColorsManager.blueGrey,
                        fontWeight: FontWeightHelper.regular,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
