import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/order_item_widget.dart';
import 'widgets/orders_search_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Orders'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16.h),
            const OrdersSearchWidget(),
            Gap(16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'On Going',
                  style: TextStyles.font14DarkBlueMedium,
                ),
                Gap(8.h),
                const OrderItemWidget(),
              ],
            ),
            Gap(20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Completed',
                  style: TextStyles.font14DarkBlueMedium,
                ),
                Gap(8.h),
                const OrderItemWidget(isCompleted: true),
              ],
            ),
          ],
        ).setHorizontalPadding(16.w),
      ),
    );
  }
}
