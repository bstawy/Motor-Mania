import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../addresses/presentation/ui/widgets/address_item_info_widget.dart';

class OrderAddressWidget extends StatelessWidget {
  const OrderAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: customColors.inverseSurface,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery Address",
            style: customTextStyles.headlineSmall?.copyWith(
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          Gap(8.h),
          Divider(
            height: 1.h,
            color: ColorsManager.blueGrey,
          ),
          Gap(16.h),
          const AddressItemInfoWidget(
            title: "Name",
            data: "Cameron Williamson",
          ),
          Gap(8.h),
          const AddressItemInfoWidget(
            title: "Address",
            data: "2972 Westheimer Rd. Santa Ana, Illinois 85486",
          ),
          Gap(8.h),
          const AddressItemInfoWidget(
            title: "Mobile Number",
            data: "(319) 555-0115",
          ),
        ],
      ),
    );
  }
}
