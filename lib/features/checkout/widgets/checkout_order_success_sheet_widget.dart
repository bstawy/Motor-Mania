import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../core/config/routing/routes.dart';
import '../../../core/config/text/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/widgets/custom_material_button.dart';

class CheckoutOrderSuccessSheet extends StatelessWidget {
  const CheckoutOrderSuccessSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65.h,
      expand: false,
      builder: (context, scrollController) {
        return SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 175.h,
                child: Image.asset("assets/images/success_image.png"),
              ),
              Gap(12.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Order Placed\n",
                  style: TextStyles.font24DarkBlueSemiBold,
                  children: [
                    TextSpan(
                      text: "Successfully!",
                      style: TextStyles.font24RedSemiBold,
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Text(
                "Thank you for your purchase! Your order has been placed successfully. We will notify you once it has been shipped. You can track your order status in the \"My Orders\" section.",
                style: TextStyles.font12BlueGreyRegular,
              ),
              Gap(24.h),
              CustomMaterialButton(
                title: "Continue Shopping",
                onClicked: () {
                  context.popUntil(
                    Routes.layoutScreen,
                  );
                },
              ),
              Gap(8.h),
              CustomMaterialButton(
                title: "Track Order",
                onClicked: () {
                  // TODO: navigate to orders screen
                },
                backgroundColor: Colors.white,
                borderColor: ColorsManager.red,
                titleStyle: TextStyles.font14RedSemiBold,
              )
            ],
          ).setOnlyPadding(32.h, 0, 16.w, 16.w),
        );
      },
    );
  }
}
