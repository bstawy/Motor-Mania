import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/config/text/text_styles.dart';
import '../../../core/config/theme/colors/colors_manager.dart';
import '../../../core/helpers/extensions/padding_ext.dart';

class CheckoutAddressWidget extends StatelessWidget {
  const CheckoutAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Address",
          style: TextStyles.font14DarkBlueMedium,
        ),
        Gap(8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/location_icon.svg"),
              Gap(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deliver to",
                    style: TextStyles.font10BlueGreyRegular,
                  ),
                  Gap(4.h),
                  Text(
                    "1234 Street Name, City Name",
                    style: TextStyles.font10DarkBlueMedium,
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorsManager.darkBlue,
                  size: 20.r,
                ),
              ),
            ],
          ),
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
