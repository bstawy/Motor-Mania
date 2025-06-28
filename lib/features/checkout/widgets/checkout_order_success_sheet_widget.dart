import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../core/config/routing/routes.dart';
import '../../../core/config/theme/colors/colors_manager.dart';
import '../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../core/helpers/assets_manager.dart';
import '../../../core/helpers/extensions/theme_ext.dart';
import '../../../core/widgets/custom_material_button.dart';
import '../../../main.dart';

class CheckoutOrderSuccessSheet extends StatelessWidget {
  const CheckoutOrderSuccessSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return DraggableScrollableSheet(
      initialChildSize: 0.68.h,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            SizedBox(
              height: 175.h,
              child: Image.asset(
                themeIsDark
                    ? AssetsManager.successDarkImage
                    : AssetsManager.successImage,
              ),
            ),
            Gap(12.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Order Placed\n",
                style: customTextStyles.displayMedium?.copyWith(
                  fontWeight: FontWeightHelper.semiBold,
                ),
                children: [
                  TextSpan(
                    text: "Successfully!",
                    style: customTextStyles.displayMedium?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Text(
              "Thank you for your purchase! Your order has been placed successfully. We will notify you once it has been shipped. You can track your order status in the \"My Orders\" section.",
              textAlign: TextAlign.center,
              style: customTextStyles.headlineSmall?.copyWith(
                color: ColorsManager.blueGrey,
                fontWeight: FontWeightHelper.regular,
              ),
            ).setHorizontalPadding(30.w),
            Gap(24.h),
            CustomMaterialButton(
              onClicked: () {
                context.popUntil(
                  Routes.layoutScreen,
                );
              },
              title: "Continue Shopping",
              titleStyle: customTextStyles.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeightHelper.semiBold,
              ),
              height: 45.h,
            ),
            Gap(8.h),
            CustomMaterialButton(
              onClicked: () {
                context.pushNamedAndRemoveUntil(
                  Routes.orders,
                  predicate: (route) => route.isFirst,
                );
              },
              title: "Track Order",
              titleStyle: customTextStyles.headlineMedium?.copyWith(
                color: ColorsManager.red,
                fontWeight: FontWeightHelper.semiBold,
              ),
              height: 45.h,
              backgroundColor: customColors.inverseSurface,
              borderColor: ColorsManager.red,
            )
          ],
        ).setOnlyPadding(32.h, 0, 16.w, 16.w);
      },
    );
  }
}
