import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/shimmer_loading_widget.dart';

class GarageLoadingWidget extends StatelessWidget {
  const GarageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ShimmerLoadingWidget(
          height: 125.h,
        ).setOnlyPadding(0, 16.h, 0, 0);
      },
    ).setOnlyPadding(12.h, 0, 16.w, 16.w);
  }
}
