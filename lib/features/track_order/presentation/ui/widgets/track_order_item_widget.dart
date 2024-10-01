import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/widgets/product_name_and_type_widget.dart';
import '../../../../../core/widgets/product_price_widget.dart';

class TrackOrderItemWidget extends StatelessWidget {
  final bool isCompleted;

  const TrackOrderItemWidget({super.key, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 80.w,
                height: 72.h,
                child: Image.network(
                    "http://10.0.2.2/motor_mania/uploads/products/brembo_5520.png"),
              ),
              Gap(16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductNameAndTypeWidget(
                    name: "Brembo 5520",
                    type: "i8 Brake Caliper",
                  ),
                  Gap(8.h),
                  const ProductPriceWidget(finalPrice: 0),
                ],
              ),
            ],
          ),
          Gap(12.h),
          Container(
            height: 1.h,
            color: ColorsManager.whiteBlue,
          ),
          Gap(12.h),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/profile_orders_icon.svg",
                width: 24.r,
                height: 24.r,
              ),
              Gap(8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("View order & invoice summery",
                      style: TextStyles.font10DarkBlueMedium),
                  Text(
                    "Find invoice, shipping details here",
                    style: TextStyles.font10BlueGreyMedium,
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: ColorsManager.blueGrey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
