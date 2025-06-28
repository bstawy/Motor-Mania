import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../widgets/custom_account_widget.dart';
import '../../widgets/social_media_sign_up.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Scaffold(
      appBar: CustomAppBar(leftPadding: 24.w, rightPadding: 24.w),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(32.h),
              Text(
                'Create Account',
                textAlign: TextAlign.left,
                style: customTextStyles.displayLarge?.copyWith(
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              Gap(8.h),
              Text(
                "Let's Get Started Together",
                style: customTextStyles.headlineMedium?.copyWith(
                  color: ColorsManager.blueGrey,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
              Gap(32.h),
              const RegisterForm(),
              Gap(16.h),
              const SocialMediaSignUp(),
              Gap(16.h),
              CustomAccountWidget(
                text: "Already have an account? ",
                buttonText: "Login",
                onPressed: () => context.pop(),
              ),
            ],
          ).setHorizontalPadding(24.w),
        ),
      ),
    );
  }
}
