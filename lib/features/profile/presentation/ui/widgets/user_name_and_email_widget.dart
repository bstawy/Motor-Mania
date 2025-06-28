import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/enums/app_modes_enums.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/helpers/save_navigation_data.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../main.dart';

class UserNameAndEmailWidget extends StatelessWidget {
  final String name;
  final String email;

  const UserNameAndEmailWidget({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: customColors.inverseSurface,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: context.read<AppManagerCubit>().appMode == AppMode.guest
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  themeIsDark
                      ? AssetsManager.profileDarkIcon
                      : AssetsManager.profileIcon,
                  width: 24.r,
                  height: 24.r,
                ),
                Gap(9.w),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "Login First, ",
                      style: customTextStyles.headlineMedium?.copyWith(
                        fontWeight: FontWeightHelper.semiBold,
                        color: ColorsManager.red,
                      ),
                      children: [
                        TextSpan(
                          text: "To see Your Profile",
                          style: customTextStyles.headlineSmall?.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                  width: 75.w,
                  child: CustomElevatedButton(
                    onPressed: () {
                      saveNavigationData(Routes.layoutScreen, 4);
                      context.pushNamed(Routes.loginScreen);
                    },
                    title: "Login",
                    titleStyle: customTextStyles.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                    backgroundColor: ColorsManager.red,
                    borderColor: ColorsManager.red,
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  themeIsDark
                      ? AssetsManager.profileDarkIcon
                      : AssetsManager.profileIcon,
                  width: 24.r,
                  height: 24.r,
                ),
                Gap(9.w),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "Welcome, ",
                      style: customTextStyles.headlineMedium?.copyWith(
                        fontWeight: FontWeightHelper.semiBold,
                        color: ColorsManager.red,
                      ),
                      children: [
                        TextSpan(
                          text: name,
                          style: customTextStyles.headlineMedium?.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                        TextSpan(
                          text: "\n$email",
                          style: customTextStyles.labelLarge?.copyWith(
                            color: ColorsManager.blueGrey,
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 23.h,
                  width: 52.w,
                  child: CustomElevatedButton(
                    onPressed: () {
                      // TODO: go to edit profile screen
                    },
                    title: "Edit",
                    iconPath: AssetsManager.editIcon,
                  ),
                ),
              ],
            ),
    );
  }
}
