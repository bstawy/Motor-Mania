import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/helpers/assets_manager.dart';
import 'new_payment_expansion_tile_widget.dart';

class NewPaymentListWidget extends StatelessWidget {
  NewPaymentListWidget({super.key});

  final List<(String, String)> paymentMethods = [
    ("Credit or Debit Card", AssetsManager.profileCardIcon),
    ("PayPal", AssetsManager.paypalLogoIcon),
    ("Apple Pay", AssetsManager.appleLogoIcon),
    ("Google Pay", AssetsManager.googleLogoIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add new payment method",
            style: TextStyles.font14DarkBlueMedium,
          ),
          Gap(12.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentMethods.length,
            separatorBuilder: (context, index) => Gap(8.h),
            itemBuilder: (context, index) {
              return NewPaymentExpansionTileWidget(
                title: paymentMethods[index].$1,
                iconPath: paymentMethods[index].$2,
              );
            },
          ),
        ],
      ),
    );
  }
}
