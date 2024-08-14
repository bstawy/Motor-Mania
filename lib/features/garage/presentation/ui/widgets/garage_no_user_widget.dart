import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class GarageNoUserWidget extends StatelessWidget {
  const GarageNoUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/login_image.png",
          height: 256.h,
          width: 290.w,
        ),
        Gap(32.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Please, ",
            style: TextStyles.font24DarkBlueSemiBold,
            children: [
              TextSpan(
                text: "Login First ",
                style: TextStyles.font24RedSemiBold,
              ),
              TextSpan(
                text: "To Add A Car",
                style: TextStyles.font24DarkBlueSemiBold,
              ),
            ],
          ),
        ).setHorizontalPadding(47.w),
        Gap(8.h),
        Text(
          "Login and add your cars to \"My Garage\" for a personalized experience and quick access to the parts you need.",
          textAlign: TextAlign.center,
          style: TextStyles.font12BlueGreyRegular,
        ).setHorizontalPadding(47.w),
        const Spacer(),
        CustomMaterialButton(
          onClicked: () {
            context.pushNamed(Routes.loginScreen);
          },
          title: "Login",
        ),
      ],
    ).setOnlyPadding(40.h, 16.h, 16.w, 16.w);
  }
}
