import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../helpers/extensions/extensions.dart';
import 'shimmer_loading_widget.dart';

class ProductsListLoadingWidget extends StatelessWidget {
  const ProductsListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerLoadingWidget(
          width: 150.w,
          height: 20.h,
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        SizedBox(
          height: 290.h,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ShimmerLoadingWidget(
                width: 150.w,
                height: 270.h,
                borderRadius: 15.r,
              ).setOnlyPadding(0, 0, 8.w, 0);
            },
          ),
        ),
      ],
    );
  }
}
