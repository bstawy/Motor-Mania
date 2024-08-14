import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../home/domain/entities/car_entity.dart';

class GarageItemWidget extends StatelessWidget {
  final CarEntity car;

  const GarageItemWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145.h,
      child: Stack(
        children: [
          Container(
            height: 125.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${car.brand} ${car.model} ${car.year}",
                  style: TextStyles.font20DarkBlueBold,
                ),
                Gap(4.h),
                Text(
                  "Your next maintenance will be at 30,000 KM.",
                  style: TextStyles.font10BlueGreyMedium,
                ).setOnlyPadding(0, 0, 0.5.sw, 0),
                Gap(8.h),
                SizedBox(
                  height: 22.h,
                  child: Row(
                    children: [
                      CustomElevatedButton(
                        onPressed: () {},
                        title: "Edit Details",
                        iconPath: "assets/icons/edit_icon.svg",
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
                          backgroundColor: ColorsManager.red.withOpacity(0.2),
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
            right: -70,
            child: SizedBox(
              height: 130.h,
              width: 268.w,
              child: Image.network(car.imageUrl ?? ""),
            ),
          ),
        ],
      ),
    );
  }
}
