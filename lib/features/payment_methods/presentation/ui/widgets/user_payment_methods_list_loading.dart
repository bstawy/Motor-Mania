import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/shimmer_loading_widget.dart';

class UserPaymentMethodsListLoadingWidget extends StatelessWidget {
  const UserPaymentMethodsListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 2,
      separatorBuilder: (context, index) => Gap(8.h),
      itemBuilder: (context, index) => ShimmerLoadingWidget(height: 60.h),
    );
  }
}
