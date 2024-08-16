import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../home/domain/entities/car_entity.dart';
import '../../logic/garage_cubit.dart';

class GarageItemWidget extends StatelessWidget {
  final CarEntity car;

  const GarageItemWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
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

          context.read<AppManagerCubit>().selectedCarId = selectedCar.id!;
          context.successSnackBar(
              "Your ${selectedCar.brand} ${selectedCar.model} selected successfully");
        } else if (state is SelectCarError) {
          context.errorSnackBar(state.failure.message ?? "Error selecting car");
        } else {
          context.successSnackBar("Loading...");
        }
      },
      builder: (context, state) {
        bool isSelected = false;
        if (state is SelectCarSuccess) {
          isSelected = car.id == state.selectedCar.id;
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
                  height: 125.h,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFC7172C) : Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${car.brand} ${car.model} ${car.year}",
                        style: TextStyles.font20DarkBlueBold.copyWith(
                          color: isSelected
                              ? Colors.white
                              : ColorsManager.darkBlue,
                        ),
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
                                  TextStyles.font8BlueGreyMedium.copyWith(
                                color: isSelected
                                    ? ColorsManager.whiteBlue
                                    : ColorsManager.blueGrey,
                              ),
                              iconPath: "assets/icons/edit_icon.svg",
                              iconColor: isSelected
                                  ? ColorsManager.whiteBlue
                                  : ColorsManager.blueGrey,
                              horizontalPadding: 12.w,
                            ),
                            Gap(4.w),
                            SizedBox(
                              width: 22.w,
                              child: CustomElevatedButton(
                                onPressed: () {},
                                iconPath: "assets/icons/trash_icon.svg",
                                iconWidth: 10.w,
                                iconHeight: 10.r,
                                iconColor: ColorsManager.red,
                                backgroundColor: isSelected
                                    ? Colors.white
                                    : ColorsManager.red.withOpacity(0.2),
                                borderWidth: 0,
                                horizontalPadding: 0,
                                verticalPadding: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Gap(8.h),
                      // SizedBox(
                      //   width: 22.w,
                      //   height: 22.h,
                      //   child: CustomElevatedButton(
                      //     onPressed: () {
                      //       //TODO: select car
                      //     },
                      //     iconPath: "assets/icons/trash_icon.svg",
                      //     iconWidth: 10.w,
                      //     iconHeight: 10.r,
                      //     iconColor: ColorsManager.red,
                      //     backgroundColor: ColorsManager.red.withOpacity(0.2),
                      //     borderWidth: 0,
                      //     horizontalPadding: 0,
                      //     verticalPadding: 0,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: -70,
                  child: SizedBox(
                    height: 130.h,
                    width: 268.w,
                    child: Image.network(car.imageUrl ?? ""),
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
