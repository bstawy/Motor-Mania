import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import 'address_item_info_widget.dart';

class AddressItemWidget extends StatelessWidget {
  final bool isDefault;

  const AddressItemWidget({
    super.key,
    this.isDefault = false,
  });

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
        children: [
          Row(
            children: [
              SvgPicture.asset(
                context.themeIsDark
                    ? AssetsManager.addresseDarkIcon
                    : AssetsManager.addresseIcon,
                width: 16.w,
                height: 20.h,
              ),
              Gap(8.w),
              Visibility(
                visible: isDefault,
                maintainState: true,
                child: Container(
                  height: 18.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsManager.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "Default",
                    style: customTextStyles.labelMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                      color: ColorsManager.red,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 23.h,
                child: CustomElevatedButton(
                  onPressed: () {
                    // TODO: Implement edit address
                  },
                  title: "Edit",
                  iconPath: AssetsManager.editIcon,
                ),
              ),
            ],
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
