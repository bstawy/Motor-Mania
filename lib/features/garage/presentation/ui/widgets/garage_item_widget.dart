import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_network_image_widget.dart';
import '../../../../home/domain/entities/car_entity.dart';
import '../../logic/garage_cubit.dart';

class GarageItemWidget extends StatelessWidget {
  final CarEntity car;

  const GarageItemWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return BlocConsumer<GarageCubit, GarageState>(
      bloc: context.read<GarageCubit>(),
      buildWhen: (previous, current) => current is SelectCarSuccess,
      listenWhen: (previous, current) =>
          current is SelectCarLoading ||
          current is SelectCarSuccess ||
          current is SelectCarError,
      listener: (context, state) {
        if (state is SelectCarSuccess) {
          final selectedCar = state.selectedCar;

          context.read<AppManagerCubit>().selectedCarId = selectedCar?.id ?? 0;
          context.successSnackBar(
              "Your ${selectedCar?.brand} ${selectedCar?.model} is now selected.");
        } else if (state is SelectCarError) {
          context.errorSnackBar(state.error.message ?? "Error selecting car");
        } else {
          context.successSnackBar("Loading...");
        }
      },
      builder: (context, state) {
        bool isSelected = false;
        if (state is SelectCarSuccess) {
          isSelected = car.id == state.selectedCar?.id;
        } else {
          isSelected = car.id == context.read<AppManagerCubit>().selectedCarId;
        }
        return SizedBox(
          height: 145.h,
          child: GestureDetector(
            onTap: () => context.read<GarageCubit>().selectCar(car.id!),
            child: Stack(
              children: [
                Container(
                  height: 130.h,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorsManager.red
                        : customColors.inverseSurface,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${car.brand} ${car.model}",
                        style: isSelected
                            ? customTextStyles.displaySmall
                                ?.copyWith(color: Colors.white)
                            : customTextStyles.displaySmall,
                      ),
                      Gap(4.h),
                      Text(
                        "Your next maintenance will be at 30,000 KM.",
                        style: TextStyles.font10BlueGreyMedium.copyWith(
                          color: isSelected
                              ? ColorsManager.whiteBlue
                              : ColorsManager.blueGrey,
                        ),
                      ).setOnlyPadding(0, 0, 0.5.sw, 0),
                      Gap(8.h),
                      SizedBox(
                        height: 22.h,
                        child: Row(
                          children: [
                            CustomElevatedButton(
                              onPressed: () {},
                              title: "Edit Details",
                              titleStyle:
                                  customTextStyles.labelMedium?.copyWith(
                                fontWeight: FontWeightHelper.medium,
                                color: isSelected
                                    ? Colors.white
                                    : ColorsManager.blueGrey,
                              ),
                              iconPath: AssetsManager.editIcon,
                              iconColor: isSelected
                                  ? Colors.white
                                  : ColorsManager.blueGrey,
                              borderColor: isSelected
                                  ? Colors.white
                                  : ColorsManager.blueGrey,
                              horizontalPadding: 12.w,
                            ),
                            Gap(4.w),
                            SizedBox(
                              width: 22.w,
                              child: CustomElevatedButton(
                                onPressed: () {
                                  context
                                      .read<GarageCubit>()
                                      .removeCar(car.id!);
                                },
                                iconPath: AssetsManager.trashIcon,
                                iconWidth: 10.w,
                                iconHeight: 10.r,
                                iconColor: isSelected
                                    ? Colors.white
                                    : ColorsManager.red,
                                backgroundColor: isSelected
                                    ? Colors.white.withOpacity(0.2)
                                    : ColorsManager.red.withOpacity(0.2),
                                borderColor: isSelected
                                    ? Colors.white.withOpacity(0.2)
                                    : ColorsManager.red.withOpacity(0.2),
                                borderWidth: 0,
                                horizontalPadding: 0,
                                verticalPadding: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: -70.w,
                  child: SizedBox(
                    height: 145.h,
                    width: 268.w,
                    child: CustomNetworkImage(
                      url:
                          '${ApiConstants.localHostImagesUrl}/${car.imageUrl ?? ""}',
                      imageWidth: 130.w,
                      imageHeight: 268.h,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
