import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/new_payment_list_widget.dart';
import 'widgets/user_payment_methods.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () {
          context.pop();
        },
        title: 'Payment Methods',
      ),
      body: CustomScrollView(
        slivers: [
          const UserPaymentMethodsWidget(),
          SliverGap(24.h),
          NewPaymentListWidget(),
        ],
      ).setOnlyPadding(16.h, 0, 16.w, 16.w),
    );
  }
}
