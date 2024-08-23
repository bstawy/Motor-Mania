import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class OrdersSearchWidget extends StatelessWidget {
  const OrdersSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              enabled: true,
              style: TextStyles.font12DarkBlueRegular,
              decoration: InputDecoration(
                hintText: 'Find Items',
                hintStyle: TextStyles.font12BlueGreyLight,
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorsManager.blueGrey,
                  size: 16.r,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 11.w,
                ),
                isDense: true,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: ColorsManager.whiteBlue,
                    width: 0.75,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: ColorsManager.whiteBlue,
                    width: 0.75,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: ColorsManager.whiteBlue,
                    width: 0.75,
                  ),
                ),
              ),
            ),
          ),
          Gap(8.w),
          Expanded(
            child: CustomElevatedButton(
              onPressed: () {},
              title: "Last 7 days",
              titleStyle: TextStyles.font10BlueGreyMedium,
              borderRadiusValue: 12.r,
              backgroundColor: ColorsManager.whiteGrey,
              borderColor: ColorsManager.whiteBlue,
            ),
          )
        ],
      ),
    );
  }
}
