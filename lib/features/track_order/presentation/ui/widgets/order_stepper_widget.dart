import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';

class OrderStepperWidget extends StatelessWidget {
  const OrderStepperWidget({super.key});

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
          _buildStep(
            title: 'Confirmed',
            subtitle: 'Your order has been confirmed',
            iconPath: 'assets/icons/order_confirmed_icon.svg',
            finished: true,
          ),
          _buildStep(
            title: 'Dispatched',
            subtitle: 'Your order has been dispatched',
            iconPath: 'assets/icons/order_dispatched_icon.svg',
            finished: true,
          ),
          _buildStep(
            title: 'Shipped',
            subtitle: 'Your order is on the way',
            iconPath: 'assets/icons/free_delivery_filled_icon.svg',
            finished: false,
          ),
          _buildStep(
            title: 'Delivered',
            subtitle: 'Your order has been delivered',
            iconPath: 'assets/icons/delivered_icon.svg',
            finished: false,
            isLast: true,
          ),
        ],
      ),
    );
  }

  _buildStep({
    required String title,
    required String subtitle,
    required String iconPath,
    required bool finished,
    bool? isLast = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: finished
                    ? ColorsManager.red.withOpacity(0.2)
                    : ColorsManager.blueGrey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                  finished ? ColorsManager.red : ColorsManager.blueGrey,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Gap(16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: finished
                      ? TextStyles.font12RedBold
                      : TextStyles.font12BlueGreyBold,
                ),
                Text(
                  subtitle,
                  style: finished
                      ? TextStyles.font10DarkBlueMedium
                      : TextStyles.font10BlueGreyMedium,
                ),
              ],
            ),
          ],
        ),
        isLast!
            ? const SizedBox()
            : Container(
                width: 2.w,
                height: 30.h,
                margin: EdgeInsets.only(left: 24.w),
                color: finished
                    ? ColorsManager.red.withOpacity(0.2)
                    : ColorsManager.blueGrey.withOpacity(0.2),
              ),
      ],
    );
  }
}
