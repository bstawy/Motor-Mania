import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:motor_mania/core/helpers/assets_manager.dart';

import '../../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../../../core/widgets/custom_network_image_widget.dart';
import '../../../../../domain/entities/car_entity.dart';
import '../../../../logic/user_cubit/user_cubit.dart';
import 'user_header_search_and_address_widget.dart';

class UserHeaderLoadedWidget extends StatelessWidget {
  final CarEntity car;

  const UserHeaderLoadedWidget({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserHeaderSearchAndAddressWidget(),
            Gap(16.h),
            Text(
              "${car.brand} ${car.model} ${car.year}",
              style: customTextStyles.displaySmall?.copyWith(
                color: Colors.white,
              ),
            ),
            Gap(6.h),
            Text(
              "Your next maintenance\nwill be at ${car.km} KM.",
              style: customTextStyles.labelLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            Gap(16.h),
            Text(
              "Your last purchases",
              style: customTextStyles.labelLarge?.copyWith(
                color: ColorsManager.blueGrey,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            Gap(8.h),
            _buildLastPurchaseItem(
              "ACDelco 480",
              customTextStyles.headlineSmall?.copyWith(
                color: ColorsManager.blueGrey,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            Gap(6.h),
            _buildLastPurchaseItem(
              "Bridgestone Tyre",
              customTextStyles.headlineSmall?.copyWith(
                color: ColorsManager.blueGrey,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsManager.tripleBackIcons),
                Gap(6.w),
                Text(
                  "Swipe to Change Car",
                  style: customTextStyles.labelLarge?.copyWith(
                    color: ColorsManager.blueGrey,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                Gap(6.w),
                SvgPicture.asset(AssetsManager.tripleForwardIcons),
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
            child: CustomNetworkImage(
              url: car.imageUrl ?? "",
              imageWidth: 290.w,
              imageHeight: 150.h,
              fit: BoxFit.fitWidth,
            ).animate().scale(duration: const Duration(milliseconds: 425)),
          ),
        ),
      ],
    );
  }

  Widget _buildLastPurchaseItem(String title, TextStyle? titleStle) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/checkmark_icon.svg"),
        Gap(6.w),
        Text(title, style: titleStle),
      ],
    );
  }
}
