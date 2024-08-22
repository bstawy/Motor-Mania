import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../core/widgets/shimmer_loading_widget.dart';

class CategoriesListLoadingWidget extends StatelessWidget {
  const CategoriesListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerLoadingWidget(
          width: 100.w,
          height: 20.h,
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        SizedBox(
          height: 75.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            separatorBuilder: (context, index) {
              return Gap(8.w);
            },
            itemBuilder: (context, index) {
              return ShimmerLoadingWidget(
                width: 71.w,
                height: 74.h,
              );
            },
          ),
        ),
      ],
    );
  }
}
