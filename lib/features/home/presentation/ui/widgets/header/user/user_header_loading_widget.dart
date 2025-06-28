import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/widgets/shimmer_loading_widget.dart';

class UserHeaderLoadingWidget extends StatelessWidget {
  const UserHeaderLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerLoadingWidget(
          height: 45.h,
          width: double.infinity,
          containerColor: ColorsManager.darkBlue,
          baseColor: const Color(0xFF1A1B28),
          highlightColor: const Color(0xFF33354E),
        ),
        Gap(8.h),
        ShimmerLoadingWidget(
          height: 30.h,
          width: double.infinity,
          containerColor: ColorsManager.darkBlue,
          baseColor: const Color(0xFF1A1B28),
          highlightColor: const Color(0xFF33354E),
        ),
        Gap(16.h),
        ShimmerLoadingWidget(
          height: 150.h,
          width: double.infinity,
          containerColor: ColorsManager.darkBlue,
          baseColor: const Color(0xFF1A1B28),
          highlightColor: const Color(0xFF33354E),
        ),
        Gap(14.h),
      ],
    ).setHorizontalPadding(16.w);
  }
}
