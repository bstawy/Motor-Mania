import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../../../core/config/text/text_styles.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/widgets/search_bar_widget.dart';
import '../../../../../../../core/widgets/shimmer_loading_widget.dart';
import '../../../../../domain/entities/car_entity.dart';
import '../../../../logic/user_cubit/user_cubit.dart';

class HomeUserHeaderWidget extends StatelessWidget {
  const HomeUserHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: handle swipe when user has only one car
    return BlocBuilder<UserCubit, UserState>(
      bloc: context.read<UserCubit>()..fetchUserData(),
      builder: (context, state) {
        if (state is UserDataLoading) {
          return _loadingWidget();
        } else if (state is UserDataLoaded) {
          context.read<AppManagerCubit>().selectedCarId = state.userCar.id!;
          return _loadedWidget(context, state.userCar);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _loadingWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerLoadingWidget(
          height: 65.h,
          width: double.infinity,
        ),
        Gap(20.h),
        ShimmerLoadingWidget(
          height: 151.h,
          width: double.infinity,
        ),
        Gap(8.h),
      ],
    ).setHorizontalPadding(16.w);
  }

  Widget _loadedWidget(BuildContext context, CarEntity car) {
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
                    style: TextStyles.font12BlueGreyMedium,
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
            Gap(16.h),
            Text(
              "Your last purchases",
              style: TextStyles.font10BlueGreySemiBold,
            ),
            Gap(8.h),
            _buildLastPurchaseItem("ACDelco 480"),
            Gap(6.h),
            _buildLastPurchaseItem("Bridgestone Tyre"),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/triple_back_icons.svg"),
                Gap(6.w),
                Text(
                  "Swipe to Change Car",
                  style: TextStyles.font10BlueGreyRegular,
                ),
                Gap(6.w),
                SvgPicture.asset("assets/icons/triple_forward_icons.svg"),
              ],
            )
          ],
        ).setHorizontalPadding(16.w),
        Positioned(
          right: -70,
          bottom: 20.h,
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                context.read<UserCubit>().selectNexCar();
              } else if (details.primaryVelocity! < 0) {
                context.read<UserCubit>().selectPreviousCar();
              }
            },
            // onPanUpdate: (details) {
            //   // Swiping in right direction.
            //   if (details.delta.dx > 0) {
            //     context.successSnackBar("car swiped right");
            //     context.read<UserCubit>().selectNexCar();
            //   }

            //   // Swiping in left direction.
            //   if (details.delta.dx < 0) {
            //     context.successSnackBar("car swiped left");
            //     context.read<UserCubit>().selectPreviousCar();
            //   }
            // },
            child: Image.network(
              car.imageUrl ?? "",
              width: 290.w,
              height: 130.h,
            ).animate().scale(duration: const Duration(milliseconds: 425)),
          ),
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
          style: TextStyles.font12BlueGreyMedium,
        ),
      ],
    );
  }
}
