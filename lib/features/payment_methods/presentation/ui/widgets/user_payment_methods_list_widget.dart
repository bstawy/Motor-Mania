import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../domain/entities/payment_method_entity.dart';
import 'user_payment_methods_list_item_widget.dart';

class UserPaymentMethodsListWidget extends StatelessWidget {
  final List<PaymentMethodEntity> paymentMethods;

  const UserPaymentMethodsListWidget({super.key, required this.paymentMethods});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: paymentMethods.length,
      separatorBuilder: (context, index) => Gap(8.h),
      itemBuilder: (context, index) {
        return UserPaymentMethodsListItemWidget(
            paymentMethod: paymentMethods[index]);
      },
    );
  }
}
