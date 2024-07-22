import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:popover/popover.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import 'quantity_pop_up_widget.dart';

class ProductQuantityAndAddToCartButtonWidget extends StatelessWidget {
  const ProductQuantityAndAddToCartButtonWidget({super.key});

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
        color: ColorsManager.darkkBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showPopover(
                context: context,
                bodyBuilder: (context) => const QuantityPopUpWidget(),
                direction: PopoverDirection.bottom,
                height: 50.h,
                width: 177.w,
                radius: 12.r,
                arrowDxOffset: -150.w,
                arrowWidth: 0,
              );
            },
            child: Container(
              width: 40.r,
              height: 40.r,
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "QTY",
                    style: TextStyles.font8LightGreyMedium
                        .copyWith(color: ColorsManager.lighterBlue),
                  ),
                  Text(
                    "1",
                    style: TextStyles.font14DarkBlueSemiBold,
                  ),
                ],
              ),
            ),
          ),
          Gap(8.w),
          Expanded(
            child: CustomMaterialButton(
              onClicked: () {},
              height: 40.h,
              backgroundColor: ColorsManager.red,
              title: "ADD TO CART",
            ),
          ),
        ],
      ),
    );
  }
}
