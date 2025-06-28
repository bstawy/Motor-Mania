import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_network_image_widget.dart';

class ProductImageAndRatingWidget extends StatelessWidget {
  final String imageUrl;
  final num rating;
  final num reviewsCount;

  const ProductImageAndRatingWidget({
    super.key,
    required this.imageUrl,
    required this.rating,
    required this.reviewsCount,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

    return Stack(
      children: [
        SizedBox(
          height: 210.h,
          width: double.infinity,
          child: CustomNetworkImage(
              url: ApiConstants.localHostImagesUrl + imageUrl),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 6.h,
              horizontal: 8.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: const Color(0xff171823),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetsManager.starIcon,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                Gap(4.w),
                Text(
                  "$rating ($reviewsCount)",
                  style: customTextStyles.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
