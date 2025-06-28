import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/config/theme/theme_cubit.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class ChangeThemeBottomSheet extends StatelessWidget {
  const ChangeThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return DraggableScrollableSheet(
      initialChildSize: 0.32.h,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            Container(
              height: 5.h,
              margin: EdgeInsets.symmetric(horizontal: 0.4.sw),
              decoration: BoxDecoration(
                color: customColors.onTertiary,
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
            Gap(16.h),
            Text(
              "Choose color theme",
              textAlign: TextAlign.center,
              style: customTextStyles.headlineLarge,
            ),
            Gap(32.h),
            CustomMaterialButton(
              onClicked: () {
                context.read<ThemeCubit>().setTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              title: "Light Mode",
              titleStyle: customTextStyles.headlineMedium?.copyWith(
                color: context.themeIsDark ? ColorsManager.red : Colors.white,
                fontWeight: FontWeightHelper.semiBold,
              ),
              backgroundColor: customColors.onPrimary,
              borderColor:
                  context.themeIsDark ? ColorsManager.red : Colors.transparent,
            ),
            Gap(16.h),
            CustomMaterialButton(
              onClicked: () {
                context.read<ThemeCubit>().setTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              title: "Dark Mode",
              titleStyle: customTextStyles.headlineMedium?.copyWith(
                color: context.themeIsDark ? Colors.white : ColorsManager.red,
                fontWeight: FontWeightHelper.semiBold,
              ),
              backgroundColor: customColors.inversePrimary,
              borderColor:
                  context.themeIsDark ? Colors.transparent : ColorsManager.red,
            ),
          ],
        ).setOnlyPadding(16.h, 0, 16.w, 16.w);
      },
    );
  }
}
