import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import 'best_seller_grid_item.dart';

class BestSellerGridWidget extends StatelessWidget {
  BestSellerGridWidget({super.key});

  final List<String> imagePaths = [
    "assets/images/disk_image.png",
    "assets/images/disk_2_image.png",
    "assets/images/filter_image.png",
    "assets/images/injector_image.png",
    "assets/images/tire_image.png",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        mainAxisExtent: 220.h,
      ),
      padding: EdgeInsets.only(bottom: 16.h),
      physics: const ClampingScrollPhysics(),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return BestSellerGridItem(
          imagePath: imagePaths[index],
        );
      },
    ).setHorizontalPadding(16.w);
  }
}
