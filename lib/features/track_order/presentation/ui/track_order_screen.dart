import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/address_item_widget.dart';
import 'widgets/order_id_widget.dart';
import 'widgets/order_stepper_widget.dart';
import 'widgets/track_order_item_widget.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Track Your Order",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OrderIdWidget(id: "JYUT98528TGRKEH8"),
            Gap(8.h),
            const OrderStepperWidget(),
            Gap(8.h),
            const TrackOrderItemWidget(),
            Gap(8.h),
            const OrderAddressWidget(),
            Gap(24.h),
          ],
        ),
      ).setOnlyPadding(16.h, 0, 16.w, 16.w),
    );
  }
}
