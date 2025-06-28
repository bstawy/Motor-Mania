import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_network_image_widget.dart';
import '../../../../../core/widgets/product_name_and_type_widget.dart';
import '../../../../../core/widgets/product_property_widget.dart';

class OrderItemWidget extends StatelessWidget {
  final bool isCompleted;

  const OrderItemWidget({super.key, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return Container(
      width: 1.sw,
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
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "Order ID ",
              style: customTextStyles.labelLarge?.copyWith(
                color: ColorsManager.blueGrey,
                fontWeight: FontWeightHelper.regular,
              ),
              children: [
                TextSpan(
                  text: "JYUT98528TGRKEH8",
                  style: customTextStyles.labelLarge?.copyWith(
                    color: ColorsManager.blueGrey,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
          Gap(12.h),
          Row(
            children: [
              SizedBox(
                width: 80.w,
                height: 72.h,
                child: const CustomNetworkImage(
                  url:
                      "http://10.0.2.2/motor_mania/uploads/products/brembo_5520.png",
                ),
              ),
              Gap(16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductNameAndTypeWidget(
                    name: "Brembo 5520",
                    type: "i8 Brake Caliper",
                  ),
                  Gap(12.h),
                  ProductPropertyWidget(
                    title: isCompleted ? "Deliverd" : "Shipped",
                    titleStyle: customTextStyles.labelLarge?.copyWith(
                      color: ColorsManager.red,
                    ),
                    iconPath: isCompleted
                        ? AssetsManager.deliveredIcon
                        : AssetsManager.freeDeliveryFilledIcon,
                  ),
                  Text(
                    "Arriving in 2 days",
                    style: customTextStyles.labelLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(12.h),
          SizedBox(
            height: 24.h,
            child: isCompleted
                ? Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          title: "Seller",
                          titleStyle: customTextStyles.labelMedium?.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          title: "Product",
                          titleStyle: customTextStyles.labelMedium?.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          title: "Delivery",
                          titleStyle: customTextStyles.labelMedium?.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          title: "Cancel Order",
                          titleStyle: customTextStyles.labelMedium?.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                            color: ColorsManager.red,
                          ),
                          backgroundColor: ColorsManager.red.withOpacity(0.2),
                          borderColor: ColorsManager.red.withOpacity(0.2),
                          borderWidth: 0.0.w,
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            context.pushNamed(Routes.trackOrder);
                          },
                          title: "Track Your Order",
                          titleStyle: customTextStyles.labelMedium?.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
