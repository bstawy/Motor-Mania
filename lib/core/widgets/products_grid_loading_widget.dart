import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_loading_widget.dart';

class ProductsGridLoadingWidget extends StatelessWidget {
  const ProductsGridLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 0.52.r,
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: 4,
      itemBuilder: (context, index) {
        return ShimmerLoadingWidget(
          height: 270.h,
          width: 150.w,
          borderRadius: 15.r,
        );
      },
    );
  }
}
