import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/font_weight_helper.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import 'cart_details_entry_widget.dart';

class CartDetailsWidget extends StatelessWidget {
  const CartDetailsWidget({super.key});

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
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [
          const CartDetailsEntryWidget(
            title: "Subtotal",
            value: "\$198.88",
          ),
          Gap(4.h),
          CartDetailsEntryWidget(
            title: "Shipping Fees",
            value: "Free",
            valueStyle: TextStyles.font10DarkBlueMedium.copyWith(
              fontWeight: FontWeightHelper.semiBold,
              color: ColorsManager.red,
            ),
          ),
          Gap(4.h),
          CartDetailsEntryWidget(
            title: "Discount",
            value: "-\$20.52",
            titleStyle: TextStyles.font10DarkBlueMedium.copyWith(
              fontWeight: FontWeightHelper.semiBold,
              color: ColorsManager.red,
            ),
            valueStyle: TextStyles.font10DarkBlueMedium.copyWith(
              fontWeight: FontWeightHelper.semiBold,
              color: ColorsManager.red,
            ),
          ),
          Gap(8.h),
          Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 4.h,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/coupon_icon.svg",
                ),
                Gap(4.w),
                Text(
                  "Hurry! You Got a Discount",
                  style: TextStyles.font8LightGreyBold.copyWith(
                    color: ColorsManager.red,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ],
            ),
          ),
          Gap(4.h),
          Divider(
            color: const Color(0xffDFE2E7),
            thickness: 1.h,
          ),
          Gap(4.h),
          Row(
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'Total ',
                  style: TextStyles.font16DarkBlueBold,
                  children: [
                    TextSpan(
                      text: '(Incl. VAT)',
                      style: TextStyles.font8LightGreyMedium.copyWith(
                        fontWeight: FontWeightHelper.regular,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                "\$178.36",
                style: TextStyles.font16DarkBlueBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
