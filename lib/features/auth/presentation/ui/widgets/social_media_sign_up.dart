import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class SocialMediaSignUp extends StatelessWidget {
  const SocialMediaSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return Column(
      children: [
        CustomMaterialButton(
          onClicked: () {},
          title: "Sign Up With Google",
          prefixWidget: SvgPicture.asset(AssetsManager.googleIcon),
          backgroundColor:
              (context.themeIsDark ? Colors.transparent : Colors.white),
          borderColor: customColors.inverseSurface,
          titleStyle: customTextStyles.headlineMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Gap(16.h),
        CustomMaterialButton(
          onClicked: () {},
          title: "Sign Up With Apple",
          prefixWidget: SvgPicture.asset(
            AssetsManager.appleIcon,
            colorFilter: ColorFilter.mode(
              customColors.primary,
              BlendMode.srcIn,
            ),
          ),
          backgroundColor:
              (context.themeIsDark ? Colors.transparent : Colors.white),
          borderColor: customColors.inverseSurface,
          titleStyle: customTextStyles.headlineMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
      ],
    );
  }
}
