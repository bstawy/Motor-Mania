import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../../core/config/text/text_styles.dart';
import '../../../../../../core/config/theme/colors_manager.dart';
import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../core/widgets/search_bar_widget.dart';
import '../../../../domain/entities/car_entity.dart';
import '../../../logic/home_cubit.dart';

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
              isUserLogged ? _buildUserHeaderWidget(context) : Container(),
            ],
          ).setHorizontalPadding(16.w),
          isUserLogged
              ? BlocBuilder<HomeCubit, HomeState>(
                  bloc: context.read<HomeCubit>(),
                  buildWhen: (previous, current) {
                    if (current is UserCarLoading || current is UserCarLoaded) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    if (state is UserCarLoading) {
                      return Positioned(
                        right: 20,
                        bottom: 0.h,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 130.h,
                            width: 200.w,
                            padding: EdgeInsets.all(13.r),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17.r),
                            ),
                          ),
                        ),
                      );
                    } else if (state is UserCarLoaded) {
                      final car = state.car;

                      return Positioned(
                        right: -70,
                        bottom: 0.h,
                        child: Image.network(
                          car.imageUrl ?? "",
                          width: 290.w,
                          height: 130.h,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildUserHeaderWidget(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>()..getUserCar(),
      buildWhen: (previous, current) {
        if (current is UserCarLoading || current is UserCarLoaded) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is UserCarLoading) {
          return _homeHeaderLoadingWidget();
        } else if (state is UserCarLoaded) {
          return _homeHeaderLoadedWidget(state.car);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _homeHeaderLoadingWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(4.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: Container(
            height: 20.h,
            width: double.infinity,
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.r),
            ),
          ),
        ),
        Gap(16.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: Container(
            height: 25.h,
            width: 135.w,
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.r),
            ),
          ),
        ),
        Gap(10.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: Container(
            height: 25.h,
            width: 125.w,
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.r),
            ),
          ),
        ),
        Gap(30.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: Container(
            height: 13.h,
            width: 125.w,
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.r),
            ),
          ),
        ),
        Gap(10.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: Container(
            height: 13.h,
            width: 125.w,
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.r),
            ),
          ),
        ),
        Gap(8.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: Container(
            height: 13.h,
            width: 125.w,
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.r),
            ),
          ),
        ),
      ],
    );
  }

  Widget _homeHeaderLoadedWidget(CarEntity car) {
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
        _buildLastPurchaseItem("Bridgestone Tyre")
      ],
    );
  }
}
