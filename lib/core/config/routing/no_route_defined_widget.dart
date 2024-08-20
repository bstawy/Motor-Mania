import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../text/text_styles.dart';

class NoRouteDefinedWidget extends StatelessWidget {
  final RouteSettings settings;
  const NoRouteDefinedWidget({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/search_empty_image.png",
              height: 300.h,
              width: 150.w,
            ),
            Gap(32.h),
            Text(
              "No Route Defined for\n${settings.name}",
              textAlign: TextAlign.center,
              style: TextStyles.font20DarkBlueBold,
            ),
          ],
        ),
      ),
    );
  }
}
