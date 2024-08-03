import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/text_styles.dart';
import '../../../core/widgets/custom_material_button.dart';

class SocialMediaSignUp extends StatelessWidget {
  const SocialMediaSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMaterialButton(
          onClicked: () {},
          title: "Sign Up With Google",
          prefixWidget: SvgPicture.asset("assets/icons/login_google_icon.svg"),
          backgroundColor: Colors.white,
          titleStyle: TextStyles.font16DarkBlueSemiBold,
        ),
        Gap(16.h),
        CustomMaterialButton(
          onClicked: () {},
          title: "Sign Up With Apple",
          prefixWidget: SvgPicture.asset("assets/icons/login_apple_icon.svg"),
          backgroundColor: Colors.white,
          titleStyle: TextStyles.font16DarkBlueSemiBold,
        ),
      ],
    );
  }
}
