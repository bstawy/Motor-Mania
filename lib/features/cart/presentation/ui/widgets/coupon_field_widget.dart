import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/text/font_weight_helper.dart';
import '../../../../../core/config/text/text_styles.dart';

class CouponFieldWidget extends StatelessWidget {
  const CouponFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 12.h,
        ),
        hintText: "Enter Coupon Code",
        hintStyle: TextStyles.font12LightGreyMedium.copyWith(
          fontWeight: FontWeightHelper.light,
        ),
        suffix: InkWell(
          onTap: () {
            // TODO: apply coupon
          },
          child: Text(
            "Apply",
            style: TextStyles.font12DarkBlueMedium.copyWith(
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
