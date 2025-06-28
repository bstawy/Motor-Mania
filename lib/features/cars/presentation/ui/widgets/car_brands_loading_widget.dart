import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/helpers/extensions/padding_ext.dart';
import '../../../../../core/widgets/shimmer_loading_widget.dart';

class CarBrandsLoadingWidget extends StatelessWidget {
  const CarBrandsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16.h),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerLoadingWidget(
                    width: 100.w,
                    height: 20.h,
                  ).setHorizontalPadding(16.w),
                  Gap(8.h),
                  ShimmerLoadingWidget(
                    width: 1.sw,
                    height: 42.h,
                  ).setHorizontalPadding(16.w),
                  Gap(16.h),
                ],
              );
            },
          ),
        ),
      ],
    ).setVerticalPadding(16.h);
  }
}
