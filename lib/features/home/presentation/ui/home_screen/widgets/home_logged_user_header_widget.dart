import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/config/text/text_styles.dart';
import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../core/widgets/search_bar_widget.dart';
import '../../../../../../core/widgets/shimmer_loading_widget.dart';
import '../../../../domain/entities/car_entity.dart';
import '../../../logic/cubit/user_cubit.dart';

class HomeLoggedUserHeaderWidget extends StatelessWidget {
  const HomeLoggedUserHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      bloc: context.read<UserCubit>()..fetchUserData(),
      builder: (context, state) {
        if (state is UserDataLoading) {
          return _homeHeaderLoadingWidget();
        } else if (state is UserDataLoaded) {
          return _homeHeaderLoadedWidget(state.userCar);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _homeHeaderLoadingWidget() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerLoadingWidget(
              height: 36.h,
              width: double.infinity,
            ),
            Gap(10.h),
            ShimmerLoadingWidget(
              height: 20.h,
              width: double.infinity,
            ),
            Gap(16.h),
            ShimmerLoadingWidget(
              height: 25.h,
              width: 135.w,
            ),
            Gap(16.h),
            ShimmerLoadingWidget(
              height: 13.h,
              width: 125.w,
            ),
            Gap(5.h),
            ShimmerLoadingWidget(
              height: 13.h,
              width: 125.w,
            ),
            Gap(16.h),
            ShimmerLoadingWidget(
              height: 13.h,
              width: 100.w,
            ),
            Gap(10.h),
            ShimmerLoadingWidget(
              height: 13.h,
              width: 60.w,
            ),
            Gap(8.h),
            ShimmerLoadingWidget(
              height: 13.h,
              width: 60.w,
            ),
            Gap(9.h)
          ],
        ).setHorizontalPadding(16.w),
        Positioned(
          right: 16.w,
          bottom: 0.h,
          child: ShimmerLoadingWidget(
            height: 150.h,
            width: 180.w,
            borderRadius: 24.r,
          ),
        ),
      ],
    );
  }

  Widget _homeHeaderLoadedWidget(CarEntity car) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarWidget(),
            Gap(8.h),
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
              "${car.brand} ${car.model} ${car.year}",
              style: TextStyles.font20WhiteBold,
            ),
            Gap(6.h),
            Text(
              "Your next maintenance\nwill be at ${car.km} KM.",
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
            _buildLastPurchaseItem("Bridgestone Tyre"),
          ],
        ).setHorizontalPadding(16.w),
        Positioned(
          right: -70,
          bottom: 0.h,
          child: Image.network(
            car.imageUrl ?? "",
            width: 290.w,
            height: 130.h,
          ).animate().scale(duration: const Duration(milliseconds: 425)),
        ),
      ],
    );
  }

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
}
