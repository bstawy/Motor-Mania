import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../core/config/theme/colors/colors_manager.dart';
import 'checkout_order_success_sheet_widget.dart';

class CheckoutOrderButtonWidget extends StatelessWidget {
  final int quantity;
  final num totalPrice;

  const CheckoutOrderButtonWidget({
    super.key,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 4.h,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.darkBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Column(
        children: [
          CustomMaterialButton(
            onClicked: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const CheckoutOrderSuccessSheet(),
                isScrollControlled: true,
                useSafeArea: true,
                backgroundColor: Colors.white,
              );
            },
            height: 40.h,
            backgroundColor: ColorsManager.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CLICK TO ORDER",
                  style: TextStyles.font12WhiteSemiBold,
                ),
                SvgPicture.asset("assets/icons/checkout_icon.svg"),
              ],
            ),
          ),
          Gap(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$quantity items",
                style: TextStyles.font12BlueGreySemiBold,
              ),
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: TextStyles.font16WhiteSemiBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
