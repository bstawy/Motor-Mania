import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import 'new_payment_field_widget.dart';

class NewPaymentExpansionTileWidget extends StatelessWidget {
  final String title;
  final String iconPath;

  const NewPaymentExpansionTileWidget({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      collapsedBackgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      backgroundColor: Colors.white,
      childrenPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      leading: SvgPicture.asset(iconPath),
      title: Text(
        title,
        style: TextStyles.font12DarkBlueMedium,
      ),
      children: [
        const NewPaymentDataFieldWidget(
          title: "Card Number",
          hintText: "Enter your card number",
        ),
        Gap(24.h),
        Row(
          children: [
            const Expanded(
              child: NewPaymentDataFieldWidget(
                title: "Expiry Date",
                hintText: "MM/YY",
              ),
            ),
            Gap(16.w),
            const Expanded(
              child: NewPaymentDataFieldWidget(
                title: "CVV",
                hintText: "Enter CVV",
              ),
            ),
          ],
        ),
        Gap(24.h),
        CustomMaterialButton(
          onClicked: () {
            // TODO: add new card
          },
          title: "Add New Card",
          backgroundColor: Colors.white,
          borderColor: ColorsManager.red,
          titleStyle: TextStyles.font14RedSemiBold,
        ),
      ],
    );
  }
}
