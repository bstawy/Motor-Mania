import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/font_weight_helper.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/product_name_and_type_widget.dart';
import '../../../../../core/widgets/product_property_widget.dart';

class OrderItemWidget extends StatelessWidget {
  final bool isCompleted;

  const OrderItemWidget({super.key, this.isCompleted = false});

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
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "Order ID ",
              style: TextStyles.font10BlueGreyRegular,
              children: [
                TextSpan(
                  text: "JYUT98528TGRKEH8",
                  style: TextStyles.font10BlueGreyMedium,
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
                child: Image.network(
                    "http://10.0.2.2/motor_mania/uploads/products/brembo_5520.png"),
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
                    titleStyle: TextStyles.font10RedBold,
                    iconPath: isCompleted
                        ? "assets/icons/delivered_icon.svg"
                        : "assets/icons/free_delivery_filled_icon.svg",
                  ),
                  Text(
                    "Arriving in 2 days",
                    style: TextStyles.font10DarkBlueMedium,
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
                          titleStyle: TextStyles.font8DarkBlueMedium.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          title: "Product",
                          titleStyle: TextStyles.font8DarkBlueMedium.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          title: "Delivery",
                          titleStyle: TextStyles.font8DarkBlueMedium.copyWith(
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
                          titleStyle: TextStyles.font8DarkBlueMedium.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                            color: ColorsManager.red,
                          ),
                          backgroundColor: ColorsManager.red.withOpacity(0.2),
                          borderWidth: 0,
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          title: "Track Your Order",
                          titleStyle: TextStyles.font8DarkBlueMedium.copyWith(
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
