import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/text_styles.dart';
import '../../../core/helpers/extensions/extensions.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(padding: 24.w),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const CustomAppBar(),
              Gap(32.h),
              Text(
                'Welcome back',
                textAlign: TextAlign.left,
                style: TextStyles.font32DarkBlueSemiBold,
              ),
              Gap(8.h),
              Text(
                "Welcome Back! Please Enter Your Details.",
                style: TextStyles.font16GreyRegular,
              ),
              Gap(32.h),
              const LoginForm(),
            ],
          ).setHorizontalPadding(24.w),
        ),
      ),
    );
  }
}
