import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/enums/app_modes_enums.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/save_navigation_data.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

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
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: context.read<AppManagerCubit>().appMode == AppMode.guest
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/profile_icon.svg",
                  width: 24.r,
                  height: 24.r,
                ),
                Gap(9.w),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "Login First, ",
                      style: TextStyles.font14DarkBlueBold,
                      children: [
                        TextSpan(
                          text: "To see Your Profile",
                          style: TextStyles.font10DarkBlueMedium,
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
                    titleStyle: TextStyles.font10RedBold.copyWith(
                      color: Colors.white,
                    ),
                    backgroundColor: ColorsManager.red,
                    borderColor: ColorsManager.red,
                    //iconPath: "assets/icons/edit_icon.svg",
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/profile_icon.svg",
                  width: 24.r,
                  height: 24.r,
                ),
                Gap(9.w),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "Welcome, ",
                      style: TextStyles.font14RedSemiBold,
                      children: [
                        TextSpan(
                          text: name,
                          style: TextStyles.font14DarkBlueSemiBold(),
                        ),
                        TextSpan(
                          text: "\n$email",
                          style: TextStyles.font10BlueGreyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 23.h,
                  width: 50.w,
                  child: CustomElevatedButton(
                    onPressed: () {
                      // TODO: go to edit profile screen
                    },
                    title: "Edit",
                    iconPath: "assets/icons/edit_icon.svg",
                  ),
                ),
              ],
            ),
    );
  }
}
