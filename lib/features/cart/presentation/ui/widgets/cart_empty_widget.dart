import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/widgets/empty_screen_widget.dart';

class CartEmptyWidget extends StatelessWidget {
  const CartEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(32.h),
          EmptyScreenWidget(
            imagePath: AssetsManager.cartEmptyImage,
            darkImagePath: AssetsManager.cartEmptyDarkImage,
            firstTextSpan: "Your Shopping Cart Looks ",
            secondTextSpan: "Empty!",
            description:
                "What are you waiting for? Start adding items to your cart now",
          ),
        ],
      ),
    );
  }
}
