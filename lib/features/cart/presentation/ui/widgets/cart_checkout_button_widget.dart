import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class CartCheckoutButtonWidget extends StatelessWidget {
  final int quantity;
  final double totalPrice;

  const CartCheckoutButtonWidget({
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
      child: CustomMaterialButton(
        onClicked: () {},
        height: 40.h,
        backgroundColor: ColorsManager.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: '$quantity items\n',
                style: TextStyles.font8WhiteRegular,
                children: [
                  TextSpan(
                    text: '\$$totalPrice',
                    style: TextStyles.font12WhiteSemiBold,
                  ),
                ],
              ),
            ),
            Text(
              "CHECKOUT",
              style: TextStyles.font12WhiteSemiBold,
            ),
            SvgPicture.asset("assets/icons/checkout_icon.svg"),
          ],
        ),
      ),
    );
  }
}
