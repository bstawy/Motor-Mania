import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';

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
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(
            color: ColorsManager.blueGrey,
            width: 1.w,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 12.h,
        ),
        hintText: "Enter Coupon Code",
        hintStyle: TextStyles.font12BlueGreyLight,
        suffix: InkWell(
          onTap: () {
            // TODO: apply coupon
          },
          child: Text(
            "Apply",
            style: TextStyles.font12DarkBlueSemiBold,
          ),
        ),
      ),
    );
  }
}
