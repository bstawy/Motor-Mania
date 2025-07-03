import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/widgets/empty_screen_widget.dart';

class FavoritesEmptyWidget extends StatelessWidget {
  const FavoritesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(32.h),
          EmptyScreenWidget(
            imagePath: AssetsManager.favoritesEmptyImage,
            darkImagePath: AssetsManager.favoritesDarkEmptyImage,
            firstTextSpan: "Ready To Make A ",
            secondTextSpan: "Wish?",
            description:
                "Start adding items you love to your Favorites by tapping on the heart icon",
          ),
        ],
      ),
    );
  }
}
