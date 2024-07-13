import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../../core/config/text/text_styles.dart';
import '../../../../../../core/config/theme/colors_manager.dart';
import '../../../../../../core/helpers/extensions/extensions.dart';
import 'search_bar_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  Widget _buildLastPurchaseItem(String title) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/checkmark_icon.svg"),
        Gap(6.w),
        Text(
          title,
          style: TextStyles.font12LightGreyMedium,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isUserLogged = context.read<AppManagerCubit>().isUserLoggedIn;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 16.h, bottom: isUserLogged ? 90.h : 80.h),
      color: ColorsManager.darkkBlue,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBarWidget(),
              Gap(12.h),
              isUserLogged ? _buildUserHeaderWidget() : Container(),
            ],
          ).setHorizontalPadding(16.w),
          isUserLogged
              ? Positioned(
                  right: -70,
                  bottom: 0.h,
                  child: Image.asset(
                    "assets/images/home_header_car.png",
                    width: 290.w,
                    height: 130.h,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildUserHeaderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/location_icon.svg"),
            Gap(6.w),
            Expanded(
              child: Text(
                "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                style: TextStyles.font12LightGreyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Gap(16.h),
        Text(
          "BMW i8 2017",
          style: TextStyles.font20WhiteBold,
        ),
        Gap(6.h),
        Text(
          "Your next maintenance\nwill be at 80,000 KM.",
          style: TextStyles.font10WhiteMedium,
        ),
        Gap(24.h),
        Text(
          "Your last purchases",
          style: TextStyles.font10LightGreySemiBold,
        ),
        Gap(8.h),
        _buildLastPurchaseItem("ACDelco 480"),
        Gap(6.h),
        _buildLastPurchaseItem("Bridgestone Tyre")
      ],
    );
  }
}
