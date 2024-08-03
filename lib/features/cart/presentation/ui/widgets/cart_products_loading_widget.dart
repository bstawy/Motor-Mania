import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/shimmer_loading_widget.dart';

class CartProductsLoadingWidget extends StatelessWidget {
  const CartProductsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerLoadingWidget(
          width: 1.sw,
          height: 182.h,
        ),
        Gap(8.h),
        ShimmerLoadingWidget(
          width: 1.sw,
          height: 182.h,
        ),
        Gap(16.h),
        ShimmerLoadingWidget(
          width: 1.sw,
          height: 42.h,
        ),
        Gap(16.h),
        ShimmerLoadingWidget(
          width: 1.sw,
          height: 138.h,
        )
      ],
    );
  }
}
