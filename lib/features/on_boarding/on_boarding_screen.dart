import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/config/routing/routes.dart';
import '../../core/config/text/text_styles.dart';
import '../../core/config/theme/colors_manager.dart';
import '../../core/helpers/extensions/extensions.dart';
import '../../core/widgets/custom_material_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/on_boarding_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: 175.w,
                height: 268.h,
                child: Image.asset(
                  'assets/images/on_boarding_header.png',
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(),
              CustomMaterialButton(
                onClicked: () {
                  context.pushReplacementNamed(Routes.layoutScreen);
                },
                title: 'Get Started',
                titleStyle: TextStyles.font16WhiteSemiBold,
                backgroundColor: ColorsManager.red,
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
